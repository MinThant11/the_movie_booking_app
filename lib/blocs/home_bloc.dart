import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:the_movie_booking_app/utils/strings.dart';
import '../data/models/movie_booking_model.dart';
import '../data/vos/movie_vo.dart';

class HomeBloc extends ChangeNotifier {
  /// Model
  final MovieBookingModel _model = MovieBookingModel();

  /// Now Showing Or Coming Soon
  String selectedText = kNowShowingLabel;

  /// Now Playing Movies
  List<MovieVO> nowPlayingMovies = [];

  /// Coming Soon Movies
  List<MovieVO> comingSoonMovies = [];

  /// Movies To Show
  List<MovieVO> movieToShow = [];

  /// Stream Subscription
  StreamSubscription? _nowPlayingMoviesSubscription;
  StreamSubscription? _comingSoonMoviesSubscription;

  HomeBloc() {
    /// Now Playing Movies From Database
    _nowPlayingMoviesSubscription = _model
        .getNowPlayingMoviesFromDatabase()
        .listen((nowPlayingMoviesFromDatabase) {
      nowPlayingMovies = nowPlayingMoviesFromDatabase;
      if (movieToShow.isEmpty) {
        movieToShow = nowPlayingMoviesFromDatabase;
        notifyListeners();
      }
    });

    /// Coming Soon Movies From Database
    _comingSoonMoviesSubscription = _model
        .getComingSoonMoviesFromDatabase()
        .listen((comingSoonMoviesFromDatabase) {
      comingSoonMovies = comingSoonMoviesFromDatabase;
    });

    /// Now Playing Movies From Network
    _model.getNowPlayingMovies();

    /// Coming Soon Movies From Network
    _model.getComingSoonMovies();
  }

  void onTapNowShowingOrComingSoon(String text) {
    /// Set Now Playing Or Coming Soon
    selectedText = text;

    /// Set Movies
    if (text == kNowShowingLabel) {
      movieToShow = nowPlayingMovies;
    } else {
      movieToShow = comingSoonMovies;
    }

    notifyListeners();
  }

  /// Cancel subscription on dispose
  @override
  void dispose() {
    _nowPlayingMoviesSubscription?.cancel();
    _comingSoonMoviesSubscription?.cancel();
    super.dispose();
  }
}

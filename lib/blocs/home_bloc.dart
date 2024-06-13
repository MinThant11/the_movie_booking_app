import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:the_movie_booking_app/data/models/tmba_model.dart';
import 'package:the_movie_booking_app/data/vos/city_vo.dart';
import 'package:the_movie_booking_app/utils/strings.dart';

import '../data/models/movie_booking_model.dart';
import '../data/vos/movie_vo.dart';

class HomeBloc {
  /// Model
  final MovieBookingModel _model = MovieBookingModel();

  /// Now Showing Or Coming Soon
  BehaviorSubject<String> selectedTextSubject = BehaviorSubject();

  /// Now Playing Movies
  List<MovieVO> nowPlayingMovies = [];

  /// Coming Soon Movies
  List<MovieVO> comingSoonMovies = [];

  /// Movies To Show
  BehaviorSubject<List<MovieVO>> movieToShowSubject = BehaviorSubject();

  /// Stream Subscription
  StreamSubscription? _nowPlayingMoviesSubscription;
  StreamSubscription? _comingSoonMoviesSubscription;
  StreamSubscription? _citySubjectSubscription;

  HomeBloc() {
    selectedTextSubject.add(kNowShowingLabel);

    /// Now Playing Movies From Database
    _nowPlayingMoviesSubscription = _model
        .getNowPlayingMoviesFromDatabase()
        .listen((nowPlayingMoviesFromDatabase) {
      nowPlayingMovies = nowPlayingMoviesFromDatabase;
      if (movieToShowSubject.valueOrNull?.isEmpty ?? true) {
        movieToShowSubject.add(nowPlayingMoviesFromDatabase);
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
    selectedTextSubject.add(text);

    /// Set Movies
    if (text == kNowShowingLabel) {
      movieToShowSubject.add(nowPlayingMovies);
    } else {
      movieToShowSubject.add(comingSoonMovies);
    }
  }

  /// Cancel subscription on dispose
  void onDisposed() {
    _nowPlayingMoviesSubscription?.cancel();
    _comingSoonMoviesSubscription?.cancel();
  }
}

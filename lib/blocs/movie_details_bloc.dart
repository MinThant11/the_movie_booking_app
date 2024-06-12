import 'dart:async';
import 'package:flutter/material.dart';
import '../data/models/movie_booking_model.dart';
import '../data/vos/credit_vo.dart';
import '../data/vos/movie_vo.dart';

class MovieDetailsBloc extends ChangeNotifier {

  /// Model
  final MovieBookingModel _model = MovieBookingModel();

  /// State
  MovieVO? movieDetails;
  List<CreditVO>? creditList;

  /// Stream Subscription
  StreamSubscription? _movieDetailsStreamSubscription;

  MovieDetailsBloc(String movieId) {
    /// Get Movie Details From Database
    _movieDetailsStreamSubscription = _model.getMovieDetailsFromDatabase(int.parse(movieId))
        .listen((movieDetailsFromDatabase) {
      movieDetails = movieDetailsFromDatabase;
      notifyListeners();
    });

    /// Get Movie Details From Network
    _model.getMovieDetails(movieId);

    /// Get Credits By Movie From Network
    _model.getCreditsByMovie(movieId).then((credits) {
      creditList = credits;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _movieDetailsStreamSubscription?.cancel();
    super.dispose();
  }
}
import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

import '../data/models/movie_booking_model.dart';
import '../data/vos/credit_vo.dart';
import '../data/vos/movie_vo.dart';

class MovieDetailsBloc {

  /// Model
  final MovieBookingModel _model = MovieBookingModel();

  /// State
  BehaviorSubject<MovieVO?> movieDetailsSubject = BehaviorSubject();
  BehaviorSubject<List<CreditVO>?> creditListSubject = BehaviorSubject();

  /// Stream Subscription
  StreamSubscription? _movieDetailsStreamSubscription;

  MovieDetailsBloc(String movieId) {
    /// Get Movie Details From Database
    _movieDetailsStreamSubscription = _model.getMovieDetailsFromDatabase(int.parse(movieId))
        .listen((movieDetailsFromDatabase) {
      movieDetailsSubject.add(movieDetailsFromDatabase);
    });

    /// Get Movie Details From Network
    _model.getMovieDetails(movieId);

    /// Get Credits By Movie From Network
    _model.getCreditsByMovie(movieId).then((credit) {
      creditListSubject.add(credit);
    });
  }

  void onDisposed() {
    _movieDetailsStreamSubscription?.cancel();
  }
}
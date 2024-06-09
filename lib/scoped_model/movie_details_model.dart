import 'dart:async';

import 'package:scoped_model/scoped_model.dart';

import '../data/models/movie_booking_model.dart';
import '../data/vos/credit_vo.dart';
import '../data/vos/movie_vo.dart';

class MovieDetailsModel extends Model {

  /// Model
  final MovieBookingModel _model = MovieBookingModel();

  /// State
  MovieVO? movieDetails;
  List<CreditVO>? creditList;

  /// Stream Subscription
  StreamSubscription? _movieDetailsStreamSubscription;

  MovieDetailsModel(String movieId) {
    /// Get Movie Details From Database
    _movieDetailsStreamSubscription = _model.getMovieDetailsFromDatabase(int.parse(movieId))
        .listen((movieDetailsFromDatabase) {
        movieDetails = movieDetailsFromDatabase;
        notifyListeners();
    });

    /// Get Movie Details From Network
    _model.getMovieDetails(movieId);

    /// Get Credits By Movie From Network
    _model.getCreditsByMovie(movieId).then((credit) {
        creditList = credit;
        notifyListeners();
    });
  }

  void onDisposed() {
    _movieDetailsStreamSubscription?.cancel();
  }

}
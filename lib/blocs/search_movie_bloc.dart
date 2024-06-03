import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:the_movie_booking_app/data/models/movie_booking_model.dart';
import 'package:the_movie_booking_app/data/vos/movie_vo.dart';

class SearchMovieBloc {
  /// Movie Model
  final MovieBookingModel _model = MovieBookingModel();

  /// Stream Controller
  StreamController<String> queryStreamController = StreamController();
  StreamController<List<MovieVO>> movieStreamController = StreamController();

  SearchMovieBloc() {
    queryStreamController.stream
        .debounceTime(const Duration(milliseconds: 500))
        .listen((query) {
      if (query.isNotEmpty) {
        _makeSearchMovieNetworkCall(query);
      }
    });
  }

  void _makeSearchMovieNetworkCall(String query) {
    _model.searchMovies(query).then((searchResults) {
      movieStreamController.sink.add(searchResults);
    }).catchError((error) {
      movieStreamController.addError(error);
    });
  }

  void onDispose() {
    queryStreamController.close();
    movieStreamController.close();
  }
}
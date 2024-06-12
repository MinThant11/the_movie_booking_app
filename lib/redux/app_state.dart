import 'package:the_movie_booking_app/utils/strings.dart';

import '../data/vos/credit_vo.dart';
import '../data/vos/movie_vo.dart';

class AppState {
  final List<MovieVO> nowPlayingMovies;
  final List<MovieVO> comingSoonMovies;
  final List<MovieVO> moviesToShow;
  final String selectedMovieType;
  final String movieId;
  final MovieVO? movieDetails;
  final List<CreditVO>? creditList;

  AppState.newState({
    required this.nowPlayingMovies,
    required this.comingSoonMovies,
    required this.moviesToShow,
    required this.selectedMovieType,
    required this.movieId,
    required this.movieDetails,
    required this.creditList
  });

  AppState.initial({
    this.nowPlayingMovies = const [],
    this.comingSoonMovies = const [],
    this.moviesToShow = const [],
    this.selectedMovieType = kNowShowingLabel,
    this.movieId = '',
    this.movieDetails,
    this.creditList,
  });
}

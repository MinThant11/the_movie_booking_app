import 'package:the_movie_booking_app/redux/actions/received_coming_soon_movies_action.dart';
import 'package:the_movie_booking_app/redux/actions/received_credit_list_action.dart';
import 'package:the_movie_booking_app/redux/actions/received_movie_details_action.dart';
import 'package:the_movie_booking_app/redux/actions/received_movie_id_action.dart';
import 'package:the_movie_booking_app/redux/actions/received_now_playing_movies_action.dart';
import 'package:the_movie_booking_app/redux/actions/switch_movies_action.dart';
import 'package:the_movie_booking_app/redux/app_state.dart';
import 'package:the_movie_booking_app/utils/strings.dart';

AppState reducer(AppState oldState, dynamic action) {
  if (action is ReceivedNowPlayingMoviesAction) {
    return AppState.newState(
        nowPlayingMovies: action.movies,
        comingSoonMovies: oldState.comingSoonMovies,
        moviesToShow: (oldState.moviesToShow.isEmpty)
            ? action.movies
            : oldState.moviesToShow,
        selectedMovieType: oldState.selectedMovieType,
        movieId: oldState.movieId,
        movieDetails: oldState.movieDetails,
        creditList: oldState.creditList
    );
  } else if (action is ReceivedComingSoonMoviesAction) {
    return AppState.newState(
        nowPlayingMovies: oldState.nowPlayingMovies,
        comingSoonMovies: action.movies,
        moviesToShow: oldState.moviesToShow,
        selectedMovieType: oldState.selectedMovieType,
        movieId: oldState.movieId,
        movieDetails: oldState.movieDetails,
        creditList: oldState.creditList
    );
  } else if (action is SwitchMoviesAction) {
    if (action.movieType == kNowShowingLabel) {
      return AppState.newState(
          nowPlayingMovies: oldState.nowPlayingMovies,
          comingSoonMovies: oldState.comingSoonMovies,
          moviesToShow: oldState.nowPlayingMovies,
          selectedMovieType: kNowShowingLabel,
          movieId: oldState.movieId,
          movieDetails: oldState.movieDetails,
          creditList: oldState.creditList
      );
    } else {
      return AppState.newState(
          nowPlayingMovies: oldState.nowPlayingMovies,
          comingSoonMovies: oldState.comingSoonMovies,
          moviesToShow: oldState.comingSoonMovies,
          selectedMovieType: kComingSoonLabel,
          movieId: oldState.movieId,
          movieDetails: oldState.movieDetails,
          creditList: oldState.creditList
      );
    }
  } else if (action is ReceivedMovieIdAction) {
    return AppState.newState(
        nowPlayingMovies: oldState.nowPlayingMovies,
        comingSoonMovies: oldState.comingSoonMovies,
        moviesToShow: oldState.comingSoonMovies,
        selectedMovieType: oldState.selectedMovieType,
        movieId: action.movieId,
        movieDetails: oldState.movieDetails,
        creditList: oldState.creditList,
    );
  } else if (action is ReceivedMovieDetailsAction) {
    return AppState.newState(
        nowPlayingMovies: oldState.nowPlayingMovies,
        comingSoonMovies: oldState.comingSoonMovies,
        moviesToShow: oldState.comingSoonMovies,
        selectedMovieType: oldState.selectedMovieType,
        movieId: oldState.movieId,
        movieDetails: action.movieDetails,
        creditList: oldState.creditList,
    );
  } else if (action is ReceivedCreditListAction) {
    return AppState.newState(
      nowPlayingMovies: oldState.nowPlayingMovies,
      comingSoonMovies: oldState.comingSoonMovies,
      moviesToShow: oldState.comingSoonMovies,
      selectedMovieType: oldState.selectedMovieType,
      movieId: oldState.movieId,
      movieDetails: oldState.movieDetails,
      creditList: action.creditList,
    );
  }

  return oldState;
}

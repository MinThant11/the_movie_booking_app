import 'package:redux/redux.dart';
import 'package:the_movie_booking_app/data/models/movie_booking_model.dart';
import 'package:the_movie_booking_app/redux/actions/fetch_coming_soon_movies_from_network_action.dart';
import 'package:the_movie_booking_app/redux/actions/fetch_credit_list_from_network_action.dart';
import 'package:the_movie_booking_app/redux/actions/fetch_movie_details_from_network_action.dart';
import 'package:the_movie_booking_app/redux/actions/fetch_now_playing_movies_from_network_action.dart';
import 'package:the_movie_booking_app/redux/actions/listen_to_coming_soon_movies_action.dart';
import 'package:the_movie_booking_app/redux/actions/listen_to_credit_list_action.dart';
import 'package:the_movie_booking_app/redux/actions/listen_to_movie_details_action.dart';
import 'package:the_movie_booking_app/redux/actions/listen_to_now_playing_movies_actions.dart';
import 'package:the_movie_booking_app/redux/actions/received_coming_soon_movies_action.dart';
import 'package:the_movie_booking_app/redux/actions/received_credit_list_action.dart';
import 'package:the_movie_booking_app/redux/actions/received_movie_details_action.dart';
import 'package:the_movie_booking_app/redux/actions/received_now_playing_movies_action.dart';
import '../app_state.dart';

void movieMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is ListenToNowPlayingMoviesActions) {
    MovieBookingModel().getNowPlayingMoviesFromDatabase().listen((newMovies) {
      store.dispatch(ReceivedNowPlayingMoviesAction(newMovies));
    });
  } else if (action is ListenToComingSoonMoviesAction) {
    MovieBookingModel().getComingSoonMoviesFromDatabase().listen((newMovies) {
      store.dispatch(ReceivedComingSoonMoviesAction(newMovies));
    });
  } else if (action is FetchNowPlayingMoviesFromNetworkAction) {
    MovieBookingModel().getNowPlayingMovies();
  } else if (action is FetchComingSoonMoviesFromNetworkAction) {
    MovieBookingModel().getComingSoonMovies();
  }
  ///
  else if (action is ListenToMovieDetailsAction) {
    MovieBookingModel().getMovieDetailsFromDatabase(int.parse(store.state.movieId)).listen((newMovieDetails) {
      store.dispatch(ReceivedMovieDetailsAction(newMovieDetails));
    });
  } else if (action is ListenToCreditListAction) {
    MovieBookingModel().getCreditsByMovie(store.state.movieId).then((newCreditList) {
      store.dispatch(ReceivedCreditListAction(newCreditList));
    });
  } else if (action is FetchMovieDetailsFromNetworkAction) {
    MovieBookingModel().getMovieDetails(store.state.movieId);
  } else if (action is FetchCreditListFromNetworkAction) {
    MovieBookingModel().getCreditsByMovie(store.state.movieId);
  }

  next(action);
}
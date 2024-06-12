import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:the_movie_booking_app/data/vos/cinema_vo.dart';
import 'package:the_movie_booking_app/data/vos/city_vo.dart';
import 'package:the_movie_booking_app/data/vos/credit_vo.dart';
import 'package:the_movie_booking_app/data/vos/movie_vo.dart';
import 'package:the_movie_booking_app/data/vos/payment_type_vo.dart';
import 'package:the_movie_booking_app/data/vos/snacks_vo.dart';
import 'package:the_movie_booking_app/data/vos/time_slot_vo.dart';
import 'package:the_movie_booking_app/data/vos/user_vo.dart';
import 'package:the_movie_booking_app/pages/logo_page.dart';
import 'package:the_movie_booking_app/persistence/hive_constants.dart';
import 'package:the_movie_booking_app/redux/actions/fetch_coming_soon_movies_from_network_action.dart';
import 'package:the_movie_booking_app/redux/actions/fetch_now_playing_movies_from_network_action.dart';
import 'package:the_movie_booking_app/redux/actions/listen_to_coming_soon_movies_action.dart';
import 'package:the_movie_booking_app/redux/actions/listen_to_now_playing_movies_actions.dart';
import 'package:the_movie_booking_app/redux/app_state.dart';
import 'package:the_movie_booking_app/redux/middleware/middleware.dart';
import 'package:the_movie_booking_app/redux/reducer/reducer.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/fonts.dart';
import 'data/vos/collection_vo.dart';
import 'data/vos/genre_vo.dart';
import 'data/vos/production_company_vo.dart';
import 'data/vos/production_country_vo.dart';
import 'data/vos/spoken_language_vo.dart';

void main() async {

  await Hive.initFlutter();

  Hive.registerAdapter(MovieVOAdapter());
  Hive.registerAdapter(CollectionVOAdapter());
  Hive.registerAdapter(GenreVOAdapter());
  Hive.registerAdapter(ProductionCompanyVOAdapter());
  Hive.registerAdapter(ProductionCountryVOAdapter());
  Hive.registerAdapter(SpokenLanguageVOAdapter());
  Hive.registerAdapter(UserVOAdapter());
  Hive.registerAdapter(CityVOAdapter());

  await Hive.openBox<MovieVO>(kBoxNameMovieVO);
  await Hive.openBox<UserVO>(kBoxNameUserVO);
  await Hive.openBox<CityVO>(kBoxNameCityVO);

  var store = Store<AppState>(
      reducer,
      initialState: AppState.initial(),
      middleware: [movieMiddleware]
  );

  store.dispatch(FetchNowPlayingMoviesFromNetworkAction());
  store.dispatch(FetchComingSoonMoviesFromNetworkAction());
  store.dispatch(ListenToNowPlayingMoviesActions());
  store.dispatch(ListenToComingSoonMoviesAction());

  runApp(MovieBookingApp(store: store));
}

class MovieBookingApp extends StatelessWidget {

  final Store<AppState> store;
  
  const MovieBookingApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
          fontFamily: kInter,
        ),
        home: const LogoPage(),
      ),
    );
  }
}

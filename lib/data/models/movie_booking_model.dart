import 'package:the_movie_booking_app/data/vos/movie_vo.dart';
import 'package:the_movie_booking_app/network/data_agents/retrofit_data_agent_impl.dart';
import 'package:the_movie_booking_app/persistence/movie_booking_database.dart';
import '../../network/data_agents/the_movie_booking_data_agent.dart';
import '../vos/credit_vo.dart';

class MovieBookingModel {
  static MovieBookingModel? _singleton;

  factory MovieBookingModel() {
    _singleton ??= MovieBookingModel._internal();
    return _singleton!;
  }

  MovieBookingModel._internal();

  /// Data Agent
  TheMovieBookingDataAgent mDataAgent = RetrofitDataAgentImpl();

  /// Now Playing Movie
  Future<List<MovieVO>> getNowPlayingMovies() {
    return mDataAgent.getNowPlayingMovies(1.toString()).then((nowPlayingMovieList) async {
      var database = await MovieBookingDatabase.getMovieBookingDatabase;

      for (var movie in nowPlayingMovieList) {
        movie.type = kMovieTypeNowPlaying;
      }

      database.movieDao.insertMovieList(nowPlayingMovieList);

      return nowPlayingMovieList;
    });
  }

  /// Coming Soon Movie
  Future<List<MovieVO>> getComingSoonMovies() {
    return mDataAgent.getComingSoonMovies(1.toString()).then((comingSoonMovieList) async {
      var database = await MovieBookingDatabase.getMovieBookingDatabase;

      for (var movie in comingSoonMovieList) {
        movie.type = kMovieTypeComingSoon;
      }

      database.movieDao.insertMovieList(comingSoonMovieList);

      return comingSoonMovieList;
    });
  }

  /// Movie Details
  Future<MovieVO> getMovieDetails(String movieId) {
    return mDataAgent.getMovieDetails(movieId).then((movie) async {
      var database = await MovieBookingDatabase.getMovieBookingDatabase;

      database.movieDao.insertMovie(movie);

      return movie;
    });
  }

  /// Credit By Movie
  Future<List<CreditVO>> getCreditsByMovie(String movieId) {
    return mDataAgent.getCreditsByMovie(movieId);
  }

  /// Get Now Playing Movie From Database
  Future<List<MovieVO>> getNowPlayingFromDatabase() async {
    var database = await MovieBookingDatabase.getMovieBookingDatabase;

    return database.movieDao.getMoviesByType(kMovieTypeNowPlaying);
  }

  /// Get Coming Soon Movie From Database
  Future<List<MovieVO>> getComingSoonMovieFromDatabase() async {
    var database = await MovieBookingDatabase.getMovieBookingDatabase;

    return database.movieDao.getMoviesByType(kMovieTypeComingSoon);
  }

  /// Get Movie By Id From Database
  Future<MovieVO?> getMovieByIdFromDatabase(int movieId) async {
    var database = await MovieBookingDatabase.getMovieBookingDatabase;

    return database.movieDao.getMovieById(movieId);
  }

}
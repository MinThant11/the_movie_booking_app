import 'package:the_movie_booking_app/data/vos/movie_vo.dart';
import 'package:the_movie_booking_app/network/data_agents/retrofit_data_agent_impl.dart';
import 'package:the_movie_booking_app/persistence/movie_dao.dart';
import '../../network/data_agents/the_movie_booking_data_agent.dart';
import '../vos/credit_vo.dart';

class MovieBookingModel {
  static MovieBookingModel? _singleton;

  factory MovieBookingModel() {
    _singleton ??= MovieBookingModel._internal();
    return _singleton!;
  }

  MovieBookingModel._internal();

  ///Dao
  final MovieDao _movieDao = MovieDao();

  /// Data Agent
  TheMovieBookingDataAgent mDataAgent = RetrofitDataAgentImpl();

  /// Search Movie
  Future<List<MovieVO>> searchMovies(String query) {
    return mDataAgent.searchMovies(query);
  }

  /// Now Playing
  // Future<List<MovieVO>>
  Future getNowPlayingMovies() {
    return mDataAgent.getNowPlayingMovies(1.toString()).then((nowPlayingMovieList) {
      for (var movie in nowPlayingMovieList) {
        movie.type = kMovieTypeNowPlaying;
      }

      _movieDao.saveMovie(nowPlayingMovieList);

      // return nowPlayingMovieList;
    });
  }

  /// Coming Soon Movie
  // Future<List<MovieVO>>
  Future getComingSoonMovies() {
    return mDataAgent.getComingSoonMovies(1.toString()).then((comingSoonMovieList) {
      for (var movie in comingSoonMovieList) {
        movie.type = kMovieTypeComingSoon;
      }

      _movieDao.saveMovie(comingSoonMovieList);

      // return comingSoonMovieList;
    });
  }

  /// Movie Details
  // Future<MovieVO>
  Future<MovieVO> getMovieDetails(String movieId) {
    return mDataAgent.getMovieDetails(movieId).then((movie) async {
      // Sync type before saving
      MovieVO? movieFromDatabase = _movieDao.getMovieById(int.parse(movieId));
      if (movieFromDatabase != null) {
        movie.type = movieFromDatabase.type;
      }

      _movieDao.saveSingleMovie(movie);
      return movie;
    });
  }

  /// Credit By Movie
  Future<List<CreditVO>> getCreditsByMovie(String movieId) {
    return mDataAgent.getCreditsByMovie(movieId);
  }

  /// --------------------- GET DAO --------------------------- ///

  /// Get Now Playing Movie From Database
  // List<MovieVO> getNowPlayingFromDatabase() {
  //   return _movieDao.getMovieByType(kMovieTypeNowPlaying);
  // }
  Stream<List<MovieVO>> getNowPlayingMoviesFromDatabase() {
    return _movieDao.watchMovieBox().map((_) => _movieDao.getMovieByType(kMovieTypeNowPlaying));
  }

  /// Get Coming Soon Movie From Database
  // List<MovieVO> getComingSoonMovieFromDatabase() {
  //   return _movieDao.getMovieByType(kMovieTypeComingSoon);
  // }
  Stream<List<MovieVO>> getComingSoonMoviesFromDatabase() {
    return _movieDao.watchMovieBox().map((_) => _movieDao.getMovieByType(kMovieTypeComingSoon));
  }

  /// Get Movie Details From Database
  // MovieVO? getMovieByIdFromDatabase(int movieId) {
  //   return _movieDao.getMovieById(movieId);
  // }
  Stream<MovieVO?> getMovieDetailsFromDatabase(int movieId) {
    return _movieDao.watchMovieBox().map((_) => _movieDao.getMovieById(movieId));
  }
}
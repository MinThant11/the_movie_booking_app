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

  /// Now Playing Movie
  Future<List<MovieVO>> getNowPlayingMovies() {
    return mDataAgent.getNowPlayingMovies(1.toString()).then((nowPlayingMovieList) async {

      for (var movie in nowPlayingMovieList) {
        movie.type = kMovieTypeNowPlaying;
      }

      _movieDao.saveMovie(nowPlayingMovieList);

      return nowPlayingMovieList;
    });
  }

  /// Coming Soon Movie
  Future<List<MovieVO>> getComingSoonMovies() {
    return mDataAgent.getComingSoonMovies(1.toString()).then((comingSoonMovieList) async {

      for (var movie in comingSoonMovieList) {
        movie.type = kMovieTypeComingSoon;
      }

      _movieDao.saveMovie(comingSoonMovieList);

      return comingSoonMovieList;
    });
  }

  /// Movie Details
  Future<MovieVO> getMovieDetails(String movieId) {
    return mDataAgent.getMovieDetails(movieId).then((movie) async {

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
  List<MovieVO> getNowPlayingFromDatabase() {
    return _movieDao.getMovieByType(kMovieTypeNowPlaying);
  }

  /// Get Coming Soon Movie From Database
  List<MovieVO> getComingSoonMovieFromDatabase() {
    return _movieDao.getMovieByType(kMovieTypeComingSoon);
  }

  /// Get Movie Details From Database
  MovieVO? getMovieByIdFromDatabase(int movieId) {
    return _movieDao.getMovieById(movieId);
  }

}
import 'package:floor/floor.dart';

import '../../data/vos/movie_vo.dart';

@dao
abstract class MovieDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMovieList(List<MovieVO> movie);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMovie(MovieVO movie);

  @Query("SELECT * FROM movies WHERE id=:movieId")
  Future<MovieVO?> getMovieById(int movieId);

  @Query("SELECT * FROM movies WHERE type=:type")
  Future<List<MovieVO>> getMoviesByType(String type);
}
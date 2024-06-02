import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:the_movie_booking_app/data/vos/movie_vo.dart';
import 'package:the_movie_booking_app/persistence/daos/movie_dao.dart';
import 'package:the_movie_booking_app/persistence/type_converters/collection_vo_type_converter.dart';
import 'package:the_movie_booking_app/persistence/type_converters/genre_id_list_type_converter.dart';
import 'package:the_movie_booking_app/persistence/type_converters/genre_list_type_converter.dart';
import 'package:the_movie_booking_app/persistence/type_converters/production_company_vo_list_type_converter.dart';
import 'package:the_movie_booking_app/persistence/type_converters/production_country_vo_list_type_converter.dart';
import 'package:the_movie_booking_app/persistence/type_converters/spoken_language_list_type_converter.dart';
import 'dart:async';

part 'movie_booking_database.g.dart';

@TypeConverters([
  CollectionVOConverter,
  GenreIdListTypeConverter,
  GenreListTypeConverter,
  ProductionCompanyVOListTypeConverter,
  ProductionCountryVOListTypeConverter,
  SpokenLanguageListTypeConverter,
])
@Database(version: 1, entities: [MovieVO])
abstract class MovieBookingDatabase extends FloorDatabase {
  static Future<MovieBookingDatabase>? _databaseFuture;

  static Future<MovieBookingDatabase> get getMovieBookingDatabase async {
    _databaseFuture ??= $FloorMovieBookingDatabase
        .databaseBuilder('movie_booking_database.db')
        .build();
    return _databaseFuture!;
  }

  MovieDao get movieDao;
}

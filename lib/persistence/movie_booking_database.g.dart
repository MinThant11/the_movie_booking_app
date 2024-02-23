// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_booking_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorMovieBookingDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MovieBookingDatabaseBuilder databaseBuilder(String name) =>
      _$MovieBookingDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MovieBookingDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$MovieBookingDatabaseBuilder(null);
}

class _$MovieBookingDatabaseBuilder {
  _$MovieBookingDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$MovieBookingDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$MovieBookingDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<MovieBookingDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$MovieBookingDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$MovieBookingDatabase extends MovieBookingDatabase {
  _$MovieBookingDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MovieDao? _movieDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `movies` (`adult` INTEGER, `backdrop_path` TEXT, `genre_ids` TEXT, `belongs_to_collection` TEXT, `budget` REAL, `genres` TEXT, `homepage` TEXT, `id` INTEGER, `imdb_id` TEXT, `original_language` TEXT, `original_title` TEXT, `overview` TEXT, `popularity` REAL, `poster_path` TEXT, `production_companies` TEXT, `production_countries` TEXT, `release_date` TEXT, `revenue` REAL, `runtime` INTEGER, `spoken_languages` TEXT, `status` TEXT, `tagline` TEXT, `title` TEXT, `video` INTEGER, `vote_average` REAL, `vote_count` INTEGER, `type` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MovieDao get movieDao {
    return _movieDaoInstance ??= _$MovieDao(database, changeListener);
  }
}

class _$MovieDao extends MovieDao {
  _$MovieDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _movieVOInsertionAdapter = InsertionAdapter(
            database,
            'movies',
            (MovieVO item) => <String, Object?>{
                  'adult': item.adult == null ? null : (item.adult! ? 1 : 0),
                  'backdrop_path': item.backDropPath,
                  'genre_ids': _genreIdListTypeConverter.encode(item.genreIds),
                  'belongs_to_collection':
                      _collectionVOConverter.encode(item.belongsToCollection),
                  'budget': item.budget,
                  'genres': _genreListTypeConverter.encode(item.genres),
                  'homepage': item.homePage,
                  'id': item.id,
                  'imdb_id': item.imdbId,
                  'original_language': item.originalLanguage,
                  'original_title': item.originalTitle,
                  'overview': item.overview,
                  'popularity': item.popularity,
                  'poster_path': item.posterPath,
                  'production_companies': _productionCompanyVOListTypeConverter
                      .encode(item.productionCompanies),
                  'production_countries': _productionCountryVOListTypeConverter
                      .encode(item.productionCountries),
                  'release_date': item.releaseDate,
                  'revenue': item.revenue,
                  'runtime': item.runTime,
                  'spoken_languages': _spokenLanguageListTypeConverter
                      .encode(item.spokenLanguages),
                  'status': item.status,
                  'tagline': item.tagLine,
                  'title': item.title,
                  'video': item.video == null ? null : (item.video! ? 1 : 0),
                  'vote_average': item.voteAverage,
                  'vote_count': item.voteCount,
                  'type': item.type
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MovieVO> _movieVOInsertionAdapter;

  @override
  Future<MovieVO?> getMovieById(int movieId) async {
    return _queryAdapter.query('SELECT * FROM movies WHERE id=?1',
        mapper: (Map<String, Object?> row) => MovieVO(
            row['adult'] == null ? null : (row['adult'] as int) != 0,
            row['backdrop_path'] as String?,
            _genreIdListTypeConverter.decode(row['genre_ids'] as String?),
            _collectionVOConverter
                .decode(row['belongs_to_collection'] as String?),
            row['budget'] as double?,
            _genreListTypeConverter.decode(row['genres'] as String?),
            row['homepage'] as String?,
            row['id'] as int?,
            row['imdb_id'] as String?,
            row['original_language'] as String?,
            row['original_title'] as String?,
            row['overview'] as String?,
            row['popularity'] as double?,
            row['poster_path'] as String?,
            _productionCompanyVOListTypeConverter
                .decode(row['production_companies'] as String?),
            _productionCountryVOListTypeConverter
                .decode(row['production_countries'] as String?),
            row['release_date'] as String?,
            row['revenue'] as double?,
            row['runtime'] as int?,
            _spokenLanguageListTypeConverter
                .decode(row['spoken_languages'] as String?),
            row['status'] as String?,
            row['tagline'] as String?,
            row['title'] as String?,
            row['video'] == null ? null : (row['video'] as int) != 0,
            row['vote_average'] as double?,
            row['vote_count'] as int?,
            type: row['type'] as String),
        arguments: [movieId]);
  }

  @override
  Future<List<MovieVO>> getMoviesByType(String type) async {
    return _queryAdapter.queryList('SELECT * FROM movies WHERE type=?1',
        mapper: (Map<String, Object?> row) => MovieVO(
            row['adult'] == null ? null : (row['adult'] as int) != 0,
            row['backdrop_path'] as String?,
            _genreIdListTypeConverter.decode(row['genre_ids'] as String?),
            _collectionVOConverter
                .decode(row['belongs_to_collection'] as String?),
            row['budget'] as double?,
            _genreListTypeConverter.decode(row['genres'] as String?),
            row['homepage'] as String?,
            row['id'] as int?,
            row['imdb_id'] as String?,
            row['original_language'] as String?,
            row['original_title'] as String?,
            row['overview'] as String?,
            row['popularity'] as double?,
            row['poster_path'] as String?,
            _productionCompanyVOListTypeConverter
                .decode(row['production_companies'] as String?),
            _productionCountryVOListTypeConverter
                .decode(row['production_countries'] as String?),
            row['release_date'] as String?,
            row['revenue'] as double?,
            row['runtime'] as int?,
            _spokenLanguageListTypeConverter
                .decode(row['spoken_languages'] as String?),
            row['status'] as String?,
            row['tagline'] as String?,
            row['title'] as String?,
            row['video'] == null ? null : (row['video'] as int) != 0,
            row['vote_average'] as double?,
            row['vote_count'] as int?,
            type: row['type'] as String),
        arguments: [type]);
  }

  @override
  Future<void> insertMovieList(List<MovieVO> movie) async {
    await _movieVOInsertionAdapter.insertList(
        movie, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertMovie(MovieVO movie) async {
    await _movieVOInsertionAdapter.insert(movie, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _collectionVOConverter = CollectionVOConverter();
final _genreIdListTypeConverter = GenreIdListTypeConverter();
final _genreListTypeConverter = GenreListTypeConverter();
final _productionCompanyVOListTypeConverter =
    ProductionCompanyVOListTypeConverter();
final _productionCountryVOListTypeConverter =
    ProductionCountryVOListTypeConverter();
final _spokenLanguageListTypeConverter = SpokenLanguageListTypeConverter();

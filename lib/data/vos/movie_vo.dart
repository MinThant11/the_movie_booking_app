import 'package:floor/floor.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking_app/data/vos/collection_vo.dart';
import 'package:the_movie_booking_app/data/vos/genre_vo.dart';
import 'package:the_movie_booking_app/data/vos/production_company_vo.dart';
import 'package:the_movie_booking_app/data/vos/production_country_vo.dart';
import 'package:the_movie_booking_app/data/vos/spoken_language_vo.dart';
import 'package:the_movie_booking_app/network/api_constants.dart';

part 'movie_vo.g.dart';

@JsonSerializable()
@Entity(tableName: "movies")
class MovieVO {
  @JsonKey(name: "adult")
  @ColumnInfo(name: "adult")
  /// hive
  bool? adult;

  @JsonKey(name: "backdrop_path")
  @ColumnInfo(name: "backdrop_path")
  String? backDropPath;

  @JsonKey(name: "genre_ids")
  @ColumnInfo(name: "genre_ids")
  List<int>? genreIds;

  @JsonKey(name: "belongs_to_collection")
  @ColumnInfo(name: "belongs_to_collection")
  CollectionVO? belongsToCollection;

  @JsonKey(name: "budget")
  @ColumnInfo(name: "budget")
  double? budget;

  @JsonKey(name: "genres")
  @ColumnInfo(name: "genres")
  List<GenreVO>? genres;

  @JsonKey(name: "homepage")
  @ColumnInfo(name: "homepage")
  String? homePage;

  @JsonKey(name: "id")
  @ColumnInfo(name: "id")
  @PrimaryKey()
  int? id;

  @JsonKey(name: "imdb_id")
  @ColumnInfo(name: "imdb_id")
  String? imdbId;

  @JsonKey(name: "original_language")
  @ColumnInfo(name: "original_language")
  String? originalLanguage;

  @JsonKey(name: "original_title")
  @ColumnInfo(name: "original_title")
  String? originalTitle;

  @JsonKey(name: "overview")
  @ColumnInfo(name: "overview")
  String? overview;

  @JsonKey(name: "popularity")
  @ColumnInfo(name: "popularity")
  double? popularity;

  @JsonKey(name: "poster_path")
  @ColumnInfo(name: "poster_path")
  String? posterPath;

  @JsonKey(name: "production_companies")
  @ColumnInfo(name: "production_companies")
  List<ProductionCompanyVO>? productionCompanies;

  @JsonKey(name: "production_countries")
  @ColumnInfo(name: "production_countries")
  List<ProductionCountryVO>? productionCountries;

  @JsonKey(name: "release_date")
  @ColumnInfo(name: "release_date")
  String? releaseDate;

  @JsonKey(name: "revenue")
  @ColumnInfo(name: "revenue")
  double? revenue;

  @JsonKey(name: "runtime")
  @ColumnInfo(name: "runtime")
  int? runTime;

  @JsonKey(name: "spoken_languages")
  @ColumnInfo(name: "spoken_languages")
  List<SpokenLanguageVO>? spokenLanguages;

  @JsonKey(name: "status")
  @ColumnInfo(name: "status")
  String? status;

  @JsonKey(name: "tagline")
  @ColumnInfo(name: "tagline")
  String? tagLine;

  @JsonKey(name: "title")
  @ColumnInfo(name: "title")
  String? title;

  @JsonKey(name: "video")
  @ColumnInfo(name: "video")
  bool? video;

  @JsonKey(name: "vote_average")
  @ColumnInfo(name: "vote_average")
  double? voteAverage;

  @JsonKey(name: "vote_count")
  @ColumnInfo(name: "vote_count")
  int? voteCount;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @ColumnInfo(name: "type")
  String type;

  MovieVO(
    this.adult,
    this.backDropPath,
    this.genreIds,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homePage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runTime,
    this.spokenLanguages,
    this.status,
    this.tagLine,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount, {
    this.type = "",
  });

  factory MovieVO.fromJson(Map<String, dynamic> json) =>
      _$MovieVOFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVOToJson(this);

  @override
  String toString() {
    return 'MovieVO{adult: $adult, backDropPath: $backDropPath, genreIds: $genreIds, belongsToCollection: $belongsToCollection, budget: $budget, genres: $genres, homePage: $homePage, id: $id, imdbId: $imdbId, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, productionCompanies: $productionCompanies, productionCountries: $productionCountries, releaseDate: $releaseDate, revenue: $revenue, runTime: $runTime, spokenLanguages: $spokenLanguages, status: $status, tagLine: $tagLine, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount}';
  }

  /// Poster path with base url
  String getPosterPathWithBaseUrl() {
    return kImageBaseUrl + (posterPath ?? "");
  }

  /// Backdrop path with base url
  String getBackdropPathWithBaseUrl() {
    return kImageBaseUrl + (backDropPath ?? "");
  }

  /// Get Rating with two decimals
  String getRatingTwoDecimals() {
    return voteAverage?.toStringAsFixed(2) ?? "";
  }

  /// Get Runtime Formatted
  String getRunTimeFormatted() {
    if (runTime != null) {
      int hours = runTime! ~/ 60;
      int minutes = runTime! % 60;
      return "$hours hr $minutes mins";
    } else {
      return "";
    }
  }

  /// Get Release Date formatted
  String getReleaseDateFormatted() {
    if (releaseDate != null) {
      DateTime dateTime = DateTime.parse(releaseDate!);
      String formattedData = DateFormat('dd MMM, yyyy').format(dateTime);
      return formattedData;
    } else {
      return "";
    }
  }
}

const String kMovieTypeNowPlaying = "now_playing";
const String kMovieTypeComingSoon = "coming_soon";

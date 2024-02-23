import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking_app/data/vos/collection_vo.dart';
import 'package:the_movie_booking_app/data/vos/genre_vo.dart';
import 'package:the_movie_booking_app/data/vos/production_company_vo.dart';
import 'package:the_movie_booking_app/data/vos/production_country_vo.dart';
import 'package:the_movie_booking_app/data/vos/spoken_language_vo.dart';
import 'package:the_movie_booking_app/network/api_constants.dart';
import 'package:the_movie_booking_app/persistence/hive_constants.dart';

part 'movie_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIdMovieVO, adapterName: kAdapterNameMovieVO)
class MovieVO {
  @JsonKey(name: "adult")
  @HiveField(0)
  bool? adult;

  @JsonKey(name: "backdrop_path")
  @HiveField(1)
  String? backDropPath;

  @JsonKey(name: "genre_ids")
  @HiveField(2)
  List<int>? genreIds;

  @JsonKey(name: "belongs_to_collection")
  @HiveField(3)
  CollectionVO? belongsToCollection;

  @JsonKey(name: "budget")
  @HiveField(4)
  double? budget;

  @JsonKey(name: "genres")
  @HiveField(5)
  List<GenreVO>? genres;

  @JsonKey(name: "homepage")
  @HiveField(6)
  String? homePage;

  @JsonKey(name: "id")
  @HiveField(7)
  int? id;

  @JsonKey(name: "imdb_id")
  @HiveField(8)
  String? imdbId;

  @JsonKey(name: "original_language")
  @HiveField(9)
  String? originalLanguage;

  @JsonKey(name: "original_title")
  @HiveField(10)
  String? originalTitle;

  @JsonKey(name: "overview")
  @HiveField(11)
  String? overview;

  @JsonKey(name: "popularity")
  @HiveField(12)
  double? popularity;

  @JsonKey(name: "poster_path")
  @HiveField(13)
  String? posterPath;

  @JsonKey(name: "production_companies")
  @HiveField(14)
  List<ProductionCompanyVO>? productionCompanies;

  @JsonKey(name: "production_countries")
  @HiveField(15)
  List<ProductionCountryVO>? productionCountries;

  @JsonKey(name: "release_date")
  @HiveField(16)
  String? releaseDate;

  @JsonKey(name: "revenue")
  @HiveField(17)
  double? revenue;

  @JsonKey(name: "runtime")
  @HiveField(18)
  int? runTime;

  @JsonKey(name: "spoken_languages")
  @HiveField(19)
  List<SpokenLanguageVO>? spokenLanguages;

  @JsonKey(name: "status")
  @HiveField(20)
  String? status;

  @JsonKey(name: "tagline")
  @HiveField(21)
  String? tagLine;

  @JsonKey(name: "title")
  @HiveField(22)
  String? title;

  @JsonKey(name: "video")
  @HiveField(23)
  bool? video;

  @JsonKey(name: "vote_average")
  @HiveField(24)
  double? voteAverage;

  @JsonKey(name: "vote_count")
  @HiveField(25)
  int? voteCount;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @HiveField(26)
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

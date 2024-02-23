import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:the_movie_booking_app/data/vos/movie_vo.dart';
import 'package:the_movie_booking_app/network/api_constants.dart';
import 'package:the_movie_booking_app/network/responses/get_credits_by_movie_response.dart';
import 'package:the_movie_booking_app/network/responses/movie_list_response.dart';

part 'the_movie_booking_api.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class TheMovieBookingApi {
  factory TheMovieBookingApi(Dio dio) = _TheMovieBookingApi;

  @GET(kEndPointGetNowPlaying)
  Future<MovieListResponse?> getNowPlayingMovies(
      @Query(kParamApiKey) String apiKey,
      @Query(kParamLanguage) String language,
      @Query(kParamPage) String page,
      );

  @GET(kEndPointGetUpcoming)
  Future<MovieListResponse?> getComingSoonMovies(
      @Query(kParamApiKey) String apiKey,
      @Query(kParamLanguage) String language,
      @Query(kParamPage) String page,
      );

  @GET("$kEndPointMovieDetails/{movie_id}")
  Future<MovieVO> getMovieDetails(
      @Path("movie_id") String movieId,
      @Query(kParamApiKey) String apiKey,
      @Query(kParamLanguage) String language,
      );

  @GET("$kEndPointGetCreditsByMovie/{movie_id}/credits")
  Future<GetCreditsByMovieResponse?> getCreditsByMovie(
      @Path("movie_id") String movieId,
      @Query(kParamApiKey) String apiKey,
      @Query(kParamLanguage) String language,
      @Query(kParamPage) String page,
      );
}
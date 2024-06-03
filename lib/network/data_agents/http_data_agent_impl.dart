import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:the_movie_booking_app/data/vos/credit_vo.dart';
import 'package:the_movie_booking_app/data/vos/movie_vo.dart';
import 'package:the_movie_booking_app/network/api_constants.dart';
import 'package:the_movie_booking_app/network/data_agents/the_movie_booking_data_agent.dart';

class HttpDataAgentImpl extends TheMovieBookingDataAgent{
  // void getNowPlayingMovies(int page) {
  //   Map<String, String> queryParameters = {kParamApiKey: kApiKey, kParamLanguage: kLanguageENUS, kParamPage: page.toString()};
  //
  //   var url = Uri.https(kBaseUrlHttp, kEndPointGetNowPlaying, queryParameters);
  //
  //   /// feature  .
  //   http.get(url).then((response) {
  //     debugPrint("Now Playing Movies =======> ${response.body.toString()}");
  //   }).catchError((error) {
  //     debugPrint("Error =======> ${error.toString()}");
  //   });
  // }

  @override
  Future<List<MovieVO>> getComingSoonMovies(String page) {
    // TODO: implement getComingSoonMovies
    throw UnimplementedError();
  }

  @override
  Future<List<CreditVO>> getCreditsByMovie(String movieId) {
    // TODO: implement getCreditsByMovie
    throw UnimplementedError();
  }

  @override
  Future<MovieVO> getMovieDetails(String movieId) {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }

  @override
  Future<List<MovieVO>> getNowPlayingMovies(String page) {
    // TODO: implement getNowPlayingMovies
    throw UnimplementedError();
  }

  @override
  Future<List<MovieVO>> searchMovies(String query) {
    // TODO: implement searchMovies
    throw UnimplementedError();
  }
}
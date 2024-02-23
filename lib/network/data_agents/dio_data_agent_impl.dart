import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/vos/credit_vo.dart';
import 'package:the_movie_booking_app/data/vos/movie_vo.dart';
import 'package:the_movie_booking_app/network/data_agents/the_movie_booking_data_agent.dart';

import '../api_constants.dart';

class DioMovieDataAgentImpl extends TheMovieBookingDataAgent{
  // void getNowPlayingMovies(int page) {
  //   Map<String, String> queryParameters = {kParamApiKey: kApiKey, kParamLanguage: kLanguageENUS, kParamPage: page.toString()};
  //
  //   Dio().get("$kBaseUrl$kEndPointGetNowPlaying", queryParameters: queryParameters).then((value) {
  //     debugPrint("Now Playing Movies =======> ${value.toString()}");
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
}
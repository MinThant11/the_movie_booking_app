import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/main_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/fonts.dart';

void main() {
  // TheMovieBookingDataAgent mDataAgent = RetrofitDataAgentImpl();
  // debugPrint(mDataAgent.getNowPlayingMovies(1.toString()).toString());
  runApp(const MovieBookingApp());
}

class MovieBookingApp extends StatelessWidget {
  const MovieBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        fontFamily: kInter,
      ),
      home: const MainPage(),
    );
  }
}
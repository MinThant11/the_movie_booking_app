import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/choose_time_and_cinema_page.dart';

import '../utils/colors.dart';

class CinemasPage extends StatelessWidget {
  const CinemasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView.builder(
          itemBuilder: (context, index) {
            return const ChooseCinema();
          }),
    );
  }
}

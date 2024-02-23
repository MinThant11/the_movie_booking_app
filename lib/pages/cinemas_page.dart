import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/choose_time_and_cinema_page.dart';

import '../utils/colors.dart';
import '../utils/dimens.dart';
import '../utils/images.dart';
import 'home_page.dart';
import 'location_page.dart';

class CinemasPage extends StatelessWidget {
  const CinemasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: kBackgroundColor,
        surfaceTintColor: kBackgroundColor,
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LocationPage()),
            );
          },
          child: Row(
            children: [
              const SizedBox(
                width: kMarginMedium,
              ),
              Image.asset(
                kLocationArrowIcon,
                width: kLocationIconSize,
                height: kLocationIconSize,
              ),
              const SizedBox(
                width: kMarginMedium,
              ),
              const Text(
                "Yangon",
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                  fontSize: kTextRegular,
                ),
              ),
            ],
          ),
        ),
        actions: const [
          SearchMovieIconView(),
          SizedBox(
            width: kHomeScreenAppBarRightMargin,
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return const ChooseCinema();
        },
        itemCount: 10,
      ),
    );
  }
}

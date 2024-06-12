import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/models/tmba_model.dart';
import 'package:the_movie_booking_app/data/vos/choose_date_vo.dart';
import 'package:the_movie_booking_app/data/vos/user_vo.dart';
import 'package:the_movie_booking_app/pages/search_moving_page.dart';
import 'package:the_movie_booking_app/pages/time_and_cinema_page.dart';

import '../data/vos/cinema_vo.dart';
import '../utils/colors.dart';
import '../utils/dimens.dart';
import '../utils/images.dart';
import 'home_page.dart';
import 'location_page.dart';

class CinemasPage extends StatelessWidget {
  const CinemasPage({
    super.key,
  });

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
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchMovingPage(),
                ),
              );
            },
            child: const Icon(
              Icons.search,
              color: Colors.white,
              size: kMarginLarge,
            ),
          ),
          const SizedBox(
            width: kHomeScreenAppBarRightMargin,
          )
        ],
      ),
      body: const CinemaScreenBodyView(),
    );
  }
}

class CinemaScreenBodyView extends StatefulWidget {
  const CinemaScreenBodyView({
    super.key,
  });

  @override
  State<CinemaScreenBodyView> createState() => _CinemaScreenBodyViewState();
}

class _CinemaScreenBodyViewState extends State<CinemaScreenBodyView> {
  /// Model
  final TmbaModel _tmbaModel = TmbaModel();

  /// State
  ChooseDateVO? chooseDateVO;
  String? date;

  /// Cinema
  List<CinemaVO> cinemaToShow = [];

  @override
  void initState() {
    super.initState();

    /// User Data From Database
    UserVO? userDataFromDatabase = _tmbaModel.getUserDataFromDatabase();

    date =
        (chooseDateVO?.isSelected == true) ? chooseDateVO?.date.toString() : '';

    /// Cinema From Network
    _tmbaModel
        .getCinema(userDataFromDatabase?.token ?? '', date ?? '')
        .then((cinemaList) {
      setState(() {
        cinemaToShow = cinemaList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ChooseCinema(
          cinema: cinemaToShow[index],
          bookingDate: date ?? '', movieName: '', posterPath: '', movieId: 0,
        );
      },
      itemCount: cinemaToShow.length,
    );
  }
}

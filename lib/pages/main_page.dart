import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/choose_time_and_cinema_page.dart';
import 'package:the_movie_booking_app/pages/cinemas_page.dart';
import 'package:the_movie_booking_app/pages/home_page.dart';
import 'package:the_movie_booking_app/pages/profile_page.dart';
import 'package:the_movie_booking_app/pages/tickets_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';
import 'package:the_movie_booking_app/utils/strings.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;

  List<Widget> screenWidgets = [const HomePage(), const ChooseTimeAndCinemaPage(), const TicketsPage(), const ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kBottomNavigationUnSelectedColor,
        selectedFontSize: kTextSmall,
        unselectedFontSize: kTextSmall,
        showUnselectedLabels: true,
        backgroundColor: kBackgroundColor,
        type: BottomNavigationBarType.fixed,
        onTap: (selectedIndex) {
          setState(() {
            currentIndex = selectedIndex;
          });
        },
        items: _getBottomNavigationBarItems(),
      ),
      body: screenWidgets[currentIndex],
    );
  }

  List<BottomNavigationBarItem> _getBottomNavigationBarItems() {
    return [
      /// Movie
      BottomNavigationBarItem(
        icon: Image.asset(
          kMoviesIcons,
          width: kMarginXLarge,
          height: kMarginXLarge,
        ),
        activeIcon: Image.asset(
          kMoviesIcons,
          width: kMarginXLarge,
          height: kMarginXLarge,
          color: kPrimaryColor,
        ),
        label: kMovieLabel,
      ),

      /// Cinemas
      BottomNavigationBarItem(
        icon: Image.asset(
          kCinemasIcon,
          width: kMarginXLarge,
          height: kMarginXLarge,
        ),
        activeIcon: Image.asset(
          kCinemasIcon,
          width: kMarginXLarge,
          height: kMarginXLarge,
          color: kPrimaryColor,
        ),
        label: kCinemasLabel,
      ),

      /// Tickets
      BottomNavigationBarItem(
        icon: Image.asset(
          kTicketIcon,
          width: kMarginXLarge,
          height: kMarginXLarge,
        ),
        activeIcon: Image.asset(
          kTicketIcon,
          width: kMarginXLarge,
          height: kMarginXLarge,
          color: kPrimaryColor,
        ),
        label: kTicketsLabel,
      ),

      /// Profile
      BottomNavigationBarItem(
        icon: Image.asset(
          kProfileIcon,
          width: kMarginXLarge,
          height: kMarginXLarge,
        ),
        activeIcon: Image.asset(
          kProfileIcon,
          width: kMarginXLarge,
          height: kMarginXLarge,
          color: kPrimaryColor,
        ),
        label: kProfileLabel,
      ),
    ];
  }
}

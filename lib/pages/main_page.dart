import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/vos/user_vo.dart';
import 'package:the_movie_booking_app/pages/cinemas_page.dart';
import 'package:the_movie_booking_app/pages/home_page.dart';
import 'package:the_movie_booking_app/pages/profile_page.dart';
import 'package:the_movie_booking_app/pages/tickets_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';
import 'package:the_movie_booking_app/utils/strings.dart';

class MainPage extends StatefulWidget {
  final String? city;
  final UserVO? userData;
  const MainPage({super.key, this.city, this.userData});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;

  // List<Widget> screenWidgets = [
  //   const HomePage(),
  //   const CinemasPage(),
  //   const TicketsPage(),
  //   const ProfilePage()
  // ];

  @override
  Widget build(BuildContext context) {
    List<Widget> screenWidgets = [
      HomePage(
        city: widget.city ?? '',
      ),
      const CinemasPage(),
      const TicketsPage(),
      const ProfilePage()
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kUnSelectedColor,
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

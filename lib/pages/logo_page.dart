import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/models/tmba_model.dart';
import 'package:the_movie_booking_app/data/vos/user_vo.dart';
import 'package:the_movie_booking_app/pages/log_in_page.dart';
import 'package:the_movie_booking_app/pages/main_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {

  /// Model
  final TmbaModel _model = TmbaModel();

  @override
  void initState() {
    super.initState();

    /// User Data From Database
    UserVO? userDataFromDatabase = _model.getUserDataFromDatabase();

    Future.delayed(const Duration(seconds: 3), () {
      if (userDataFromDatabase != null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const MainPage()),
                (route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LogInPage()),
                (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Image.asset(
          kLogoWithText,
          width: kLogoWidth,
          height: kLogoHeight,
        ),
      ),
    );
  }
}

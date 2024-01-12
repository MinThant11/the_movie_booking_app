import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/main_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/images.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../list_items/mini_ticket_view.dart';

class TicketConfirmationPage extends StatelessWidget {
  const TicketConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ScreenView(),
      ),
    );
  }
}

class ScreenView extends StatefulWidget {
  const ScreenView({super.key});

  @override
  State<ScreenView> createState() => _ScreenViewState();
}

class _ScreenViewState extends State<ScreenView> {
  bool isShowBookingSuccessImage = true;

  @override
  void initState() {
    super.initState();
    isShowBookingSuccessImage = true;
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isShowBookingSuccessImage = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Title
        const Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Ticket Information',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),

        /// Ticket, QR And Pin
        const TicketAndQRView(),

        /// Button
        Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MainPage()),
                  (router) => false);
            },
            child: Container(
              width: 176,
              height: 48,
              margin: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'DONE',
                  style: TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),

        /// Image
        Visibility(
          visible: isShowBookingSuccessImage,
          child: Container(
            color: kBackgroundColor.withOpacity(0.9),
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 50),
            child: Center(
              child: Image.asset(
                kBookingSuccessful,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TicketAndQRView extends StatelessWidget {
  const TicketAndQRView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 70),
          child: MiniTicketView(),
        ),
        const SizedBox(
          height: 110,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            QrImageView(
              data: 'WAG5LP1C',
              version: QrVersions.auto,
              size: 120,
              backgroundColor: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'WAG5LP1C',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w700,
                height: 0,
                letterSpacing: -0.33,
              ),
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'TPIN :',
                    style: TextStyle(
                      color: Color(0xFF888888),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: ' WKCSL96',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ],
    );
  }
}

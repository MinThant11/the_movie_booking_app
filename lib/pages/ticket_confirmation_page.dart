import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:the_movie_booking_app/data/models/tmba_model.dart';
import 'package:the_movie_booking_app/data/vos/checkout_vo.dart';
import 'package:the_movie_booking_app/data/vos/snacks_vo.dart';
import 'package:the_movie_booking_app/data/vos/time_slot_vo.dart';
import 'package:the_movie_booking_app/data/vos/user_vo.dart';
import 'package:the_movie_booking_app/network/api_constants.dart';
import 'package:the_movie_booking_app/network/requests/checkout_request.dart';
import 'package:the_movie_booking_app/pages/main_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';

import '../list_items/mini_ticket_view.dart';

class TicketConfirmationPage extends StatelessWidget {
  final CheckoutRequest checkoutRequest;
  final String movieName;
  final String posterPath;
  final TimeSlotVO timeSlotVO;
  final String seats;
  final String bookingDate;
  final int movieId;
  final List<SnacksVO> selectedSnacksList;
  final String cinema;
  const TicketConfirmationPage(
      {super.key,
      required this.timeSlotVO,
      required this.seats,
      required this.bookingDate,
      required this.movieId,
      required this.selectedSnacksList,
      required this.movieName,
      required this.posterPath,
      required this.cinema, required this.checkoutRequest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ScreenView(
          timeSlotVO: timeSlotVO,
          seats: seats,
          bookingDate: bookingDate,
          movieId: movieId,
          selectedSnacksList: selectedSnacksList,
          movieName: movieName,
          posterPath: posterPath,
          cinema: cinema,
        ),
      ),
    );
  }
}

class ScreenView extends StatefulWidget {
  final String movieName;
  final String posterPath;
  final TimeSlotVO timeSlotVO;
  final String seats;
  final String bookingDate;
  final int movieId;
  final List<SnacksVO> selectedSnacksList;
  final String cinema;
  const ScreenView(
      {super.key,
      required this.timeSlotVO,
      required this.seats,
      required this.bookingDate,
      required this.movieId,
      required this.selectedSnacksList,
      required this.movieName,
      required this.posterPath,
      required this.cinema});

  @override
  State<ScreenView> createState() => _ScreenViewState();
}

class _ScreenViewState extends State<ScreenView> {
  
  /// Model
  final TmbaModel _tmbaModel = TmbaModel();

  /// Checkout
  CheckoutVO? checkoutVO;
  
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

    /// User Data From Database
    UserVO? userDataFromDatabase = _tmbaModel.getUserDataFromDatabase();
    
    /// Checkout Response From Network
    _tmbaModel.getCheckout(userDataFromDatabase?.token ?? '').then((getCheckout) {
      setState(() {
        checkoutVO = getCheckout;

        print("Checkout1 ============> $getCheckout");
      });
    });

    print("Checkout ============> $checkoutVO");
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
        TicketAndQRView(
          timeSlotVO: widget.timeSlotVO,
          seats: widget.seats,
          bookingDate: widget.bookingDate,
          movieId: widget.movieId,
          selectedSnacksList: widget.selectedSnacksList,
          movieName: widget.movieName,
          posterPath: widget.posterPath,
          cinema: widget.cinema, checkoutVO: checkoutVO,
        ),

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
  final CheckoutVO? checkoutVO;
  final String movieName;
  final String posterPath;
  final TimeSlotVO timeSlotVO;
  final String seats;
  final String bookingDate;
  final int movieId;
  final String cinema;
  final List<SnacksVO> selectedSnacksList;
  const TicketAndQRView({
    super.key,
    required this.movieName,
    required this.posterPath,
    required this.timeSlotVO,
    required this.seats,
    required this.bookingDate,
    required this.movieId,
    required this.selectedSnacksList,
    required this.cinema, required this.checkoutVO,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 70),
          child: MiniTicketView(
            timeSlotVO: timeSlotVO,
            seats: seats,
            bookingDate: bookingDate,
            movieId: movieId,
            selectedSnacksList: selectedSnacksList,
            movieName: movieName,
            posterPath: posterPath,
            cinema: cinema,
          ),
        ),
        const SizedBox(
          height: 110,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image.network(
            //   "$kTmbaImageBaseUrl${checkoutVO?.qrCode}",
            //   width: kTimeSelectViewHeight,
            //   height: kTimeSelectViewHeight,
            //   fit: BoxFit.cover,
            // ),
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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/models/tmba_model.dart';
import 'package:the_movie_booking_app/data/vos/payment_type_vo.dart';
import 'package:the_movie_booking_app/data/vos/snacks_vo.dart';
import 'package:the_movie_booking_app/data/vos/time_slot_vo.dart';
import 'package:the_movie_booking_app/data/vos/user_vo.dart';
import 'package:the_movie_booking_app/network/requests/checkout_request.dart';
import 'package:the_movie_booking_app/pages/ticket_confirmation_page.dart';
import 'package:the_movie_booking_app/utils/images.dart';

import '../utils/colors.dart';

class TicketPage extends StatelessWidget {
  final String movieName;
  final String posterPath;
  final TimeSlotVO timeSlotVO;
  final String seats;
  final String bookingDate;
  final int movieId;
  final List<SnacksVO> selectedSnacksList;
  final String cinema;
  const TicketPage(
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: kBackgroundColor,
        title: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Payment',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
      body: TicketBodyScreenView(
        timeSlotVO: timeSlotVO,
        seats: seats,
        bookingDate: bookingDate,
        movieId: movieId,
        selectedSnacksList: selectedSnacksList,
        movieName: movieName,
        posterPath: posterPath,
        cinema: cinema,
      ),
    );
  }
}

/// Ticket Body Screen
class TicketBodyScreenView extends StatefulWidget {
  final String movieName;
  final String posterPath;
  final TimeSlotVO timeSlotVO;
  final String seats;
  final String bookingDate;
  final int movieId;
  final List<SnacksVO> selectedSnacksList;
  final String cinema;
  const TicketBodyScreenView({
    super.key,
    required this.timeSlotVO,
    required this.seats,
    required this.bookingDate,
    required this.movieId,
    required this.selectedSnacksList,
    required this.movieName,
    required this.posterPath,
    required this.cinema,
  });

  @override
  State<TicketBodyScreenView> createState() => _TicketBodyScreenViewState();
}

class _TicketBodyScreenViewState extends State<TicketBodyScreenView> {
  /// Model
  final TmbaModel _tmbaModel = TmbaModel();

  /// Bearer Token
  String? bearerToken;

  /// Payment Types
  List<PaymentTypeVO> paymentTypes = [];

  /// Stream Subscription
  StreamSubscription? _paymentTypesStreamSubscription;

  @override
  void dispose() {
    _paymentTypesStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    /// User Data From Database
    UserVO? userDataFromDatabase = _tmbaModel.getUserDataFromDatabase();
    bearerToken = userDataFromDatabase?.token;

    /// Get Payment Types From Database
    _paymentTypesStreamSubscription =
        _tmbaModel.getPaymentTypesFromDatabase().listen((paymentTypeFromDatabase) {
      setState(() {
        paymentTypes = paymentTypeFromDatabase;
      });
    });

    /// Payment Types From Network
    _tmbaModel.getPaymentTypes(userDataFromDatabase?.token ?? '').then((_) {});
    // _tmbaModel
    //     .getPaymentTypes(userDataFromDatabase?.token ?? '')
    //     .then((paymentTypesFromNetwork) {
    //   setState(() {
    //     paymentTypes = paymentTypesFromNetwork;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Input View
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: 70,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          labelText: 'Your Name',
                          hintText: "Enter your name",
                          hintStyle: const TextStyle(
                            color: Color(0xFF444444),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        // controller: _controller,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '*',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFF0000),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          /// Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Container(
                height: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: kPrimaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    /// Image
                    Image.asset(
                      kPercentIcon,
                      width: 22,
                      height: 22,
                    ),

                    /// Spacer
                    const SizedBox(
                      width: 10,
                    ),

                    /// Text
                    const Text(
                      'Unlock Offer or Apply Promo-code',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF111111),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                )),
          ),

          /// Title
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 36),
            child: Text(
              'Choose your payment type',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 3),
            ),
          ),

          /// Payment Type
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      var checkoutRequest = CheckoutRequest(
                          "name",
                          widget.timeSlotVO.cinemaDayTimeslotId,
                          widget.seats,
                          widget.bookingDate,
                          widget.movieId,
                          paymentTypes[index].id,
                          widget.selectedSnacksList);

                      /// Checkout To Network
                      _tmbaModel
                          .checkoutRequest(bearerToken ?? '', checkoutRequest)
                          .then((checkoutRequest) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TicketConfirmationPage(
                              timeSlotVO: widget.timeSlotVO,
                              seats: widget.seats,
                              bookingDate: widget.bookingDate,
                              movieId: widget.movieId,
                              selectedSnacksList: widget.selectedSnacksList,
                              movieName: widget.movieName,
                              posterPath: widget.posterPath,
                              cinema: widget.cinema,
                              checkoutRequest: checkoutRequest,
                            ),
                          ),
                        );
                      });
                    },
                    child: PaymentTypesView(
                      paymentType: paymentTypes[index],
                    ),
                  );
                },
                itemCount: paymentTypes.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Payment Type
class PaymentTypesView extends StatelessWidget {
  final PaymentTypeVO paymentType;
  const PaymentTypesView({
    super.key,
    required this.paymentType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3FFFFFFF),
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          /// Payment Icon
          Image.asset(
            kUPI,
            width: 22,
            height: 22,
          ),

          /// Spacer
          const SizedBox(
            width: 10,
          ),

          /// Payment Name
          Text(
            paymentType.title ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),

          /// Spacer
          const Spacer(),

          /// Forward Icon
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

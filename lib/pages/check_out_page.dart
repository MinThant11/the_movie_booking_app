import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/vos/snacks_vo.dart';
import 'package:the_movie_booking_app/data/vos/time_slot_vo.dart';
import 'package:the_movie_booking_app/list_items/ticket_button_view.dart';
import 'package:the_movie_booking_app/pages/ticket_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/strings.dart';

import '../list_items/ticket_details_view.dart';

class CheckOutPage extends StatelessWidget {
  final int movieId;
  final String movieName;
  final String posterPath;
  final String cinema;
  final TimeSlotVO timeSlotVO;
  final String cinemaScreen;
  final String bookingDate;
  final String seats;
  final int ticketCount;
  final int seatTotalPrice;
  final List<SnacksVO>? selectedSnacksList;
  final int? snacksTotalPrice;
  const CheckOutPage({
    super.key,
    required this.movieName,
    required this.posterPath,
    required this.cinema,
    required this.cinemaScreen,
    required this.bookingDate,
    required this.seats,
    required this.ticketCount,
    required this.seatTotalPrice,
    this.selectedSnacksList,
    this.snacksTotalPrice,
    required this.timeSlotVO,
    required this.movieId,
  });

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
                  size: kMargin30,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                kCheckOutLabel,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: kTextRegular4x,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
      body: CheckOutScreenView(
        movieName: movieName,
        posterPath: posterPath,
        cinema: cinema,
        cinemaScreen: cinemaScreen,
        bookingDate: bookingDate,
        seats: seats,
        ticketCount: ticketCount,
        seatTotalPrice: seatTotalPrice,
        selectedSnacksList: selectedSnacksList ?? [],
        timeSlotVO: timeSlotVO,
        movieId: movieId,
      ),
    );
  }
}

/// Check Out Screen View
class CheckOutScreenView extends StatefulWidget {
  final int movieId;
  final String movieName;
  final String posterPath;
  final String cinema;
  final TimeSlotVO timeSlotVO;
  final String cinemaScreen;
  final String bookingDate;
  final String seats;
  final int ticketCount;
  final int seatTotalPrice;
  final List<SnacksVO> selectedSnacksList;
  const CheckOutScreenView({
    super.key,
    required this.movieName,
    required this.posterPath,
    required this.cinema,
    required this.cinemaScreen,
    required this.bookingDate,
    required this.seats,
    required this.ticketCount,
    required this.seatTotalPrice,
    required this.selectedSnacksList,
    required this.timeSlotVO,
    required this.movieId,
  });

  @override
  State<CheckOutScreenView> createState() => _CheckOutScreenViewState();
}

class _CheckOutScreenViewState extends State<CheckOutScreenView> {
  ///
  double snacksTotalPrice = 0;
  double convenienceFee = 500;
  double total = 0;

  @override
  void initState() {
    super.initState();
    calculateSnacksTotalPrice();
    calculateTotalPrice();
  }

  void removeItem(SnacksVO snacks) {
    widget.selectedSnacksList.removeWhere((snack) {
      return snacks.id == snack.id;
    });
    calculateSnacksTotalPrice();
    calculateTotalPrice();
  }

  void calculateSnacksTotalPrice() {
    setState(() {
      snacksTotalPrice = widget.selectedSnacksList
          .map((snacks) => (snacks.price ?? 0) * (snacks.quantity ?? 0))
          .reduce((value1, value2) => value1 + value2);
    });
  }

  void calculateTotalPrice() {
    setState(() {
      total = widget.seatTotalPrice + snacksTotalPrice + convenienceFee;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: kMarginMedium4,
                top: kMarginCardMedium2,
                right: kMarginMedium4),
            child: TicketDetailsView(
              movieName: widget.movieName,
              posterPath: widget.posterPath,
              cinema: widget.cinema,
              cinemaScreen: widget.cinemaScreen,
              bookingDate: widget.bookingDate,
              seats: widget.seats,
              ticketCount: widget.ticketCount,
              seatTotalPrice: widget.seatTotalPrice,
              selectedSnacksList: widget.selectedSnacksList,
              removeItem: (snacks) {
                removeItem(snacks);
              },
              snacksTotalPrice: snacksTotalPrice,
              convenienceFee: convenienceFee,
              total: total,
              timeSlotVO: widget.timeSlotVO,
            ),
          ),

          /// Button
          Positioned(
            left: kMargin90,
            bottom: kMarginXLarge,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TicketPage(
                            timeSlotVO: widget.timeSlotVO,
                            seats: widget.seats,
                            bookingDate: widget.bookingDate,
                            movieId: widget.movieId,
                            selectedSnacksList: widget.selectedSnacksList,
                            movieName: widget.movieName,
                            posterPath: widget.posterPath, cinema: widget.cinema,
                          )),
                );
              },
              child: const TicketButtonView(buttonName: kContinueLabel),
            ),
          ),
        ],
      ),
    );
  }
}

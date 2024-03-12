import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/models/tmba_model.dart';
import 'package:the_movie_booking_app/data/vos/seat_vo.dart';
import 'package:the_movie_booking_app/data/vos/user_vo.dart';
import 'package:the_movie_booking_app/list_items/status_view.dart';
import 'package:the_movie_booking_app/list_items/ticket_button_view.dart';
import 'package:the_movie_booking_app/pages/snack_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';
import 'package:the_movie_booking_app/utils/strings.dart';

class SeatsPage extends StatelessWidget {
  final int timeSlotId;
  final String bookingDate;
  const SeatsPage(
      {super.key, required this.timeSlotId, required this.bookingDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SeatScreenView(
          timeSlotId: timeSlotId,
          bookingDate: bookingDate,
        ),
      ),
    );
  }
}

/// Seat Screen
class SeatScreenView extends StatefulWidget {
  final int timeSlotId;
  final String bookingDate;
  const SeatScreenView(
      {super.key, required this.timeSlotId, required this.bookingDate});

  @override
  State<SeatScreenView> createState() => _SeatScreenViewState();
}

class _SeatScreenViewState extends State<SeatScreenView> {
  /// Model
  final TmbaModel _tmbaModel = TmbaModel();

  /// Seat List
  List<SeatVO> seatsList = [];

  /// State
  int? columCount;
  int ticketCount = 0;
  int totalPrice = 0;

  @override
  void initState() {
    super.initState();

    /// User Data From Database
    UserVO? userDataFromDatabase = _tmbaModel.getUserDataFromDatabase();

    /// Get Seating Plan From Network
    _tmbaModel
        .getSeatingPlan(
            userDataFromDatabase?.token ?? '', widget.timeSlotId, "2024-3-10")
        .then((twoDimensionalSeatList) {
      columCount = twoDimensionalSeatList.first.length;
      setState(() {
        seatsList =
            twoDimensionalSeatList.expand((element) => element).toList();
      });
    });
  }

  void calculateSelectedSeatCount() {
    ticketCount = seatsList.where((seat) => seat.isSelected == true).length;
  }

  void calculateSelectedSeatTotalPrice() {
    totalPrice = seatsList
            .where((seat) => seat.isSelected == true)
            .map((seat) => seat.price)
            .reduce((value1, value2) => (value1 ?? 0) + (value2 ?? 0)) ??
        0;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Icon
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Padding(
                  padding:
                      EdgeInsets.only(top: kMarginMedium, left: kMarginMedium),
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: kIMDBHeight,
                  ),
                ),
              ),

              /// Image
              Image.asset(
                kSeatScreenImage,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              /// Price
              const Center(
                child: Text(
                  'Normal (4500ks)',
                  style: TextStyle(
                    color: kUnSelectedColor,
                    fontSize: kTextRegular2x,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              /// Spacer
              const SizedBox(
                height: kMarginMedium3,
              ),

              /// Seats
              InteractiveViewer(
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.51,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: kMarginMedium3),
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columCount ?? 14,
                          crossAxisSpacing: kMargin5,
                          mainAxisSpacing: kMargin10,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (seatsList[index].isSelected == true) {
                                for (var value in seatsList) {
                                  if (seatsList[index].id == value.id) {
                                    setState(() {
                                      seatsList[index].isSelected = false;

                                      calculateSelectedSeatCount();
                                      calculateSelectedSeatTotalPrice();
                                    });
                                  }
                                }
                              } else if (seatsList[index].type == "available") {
                                for (var value in seatsList) {
                                  if (seatsList[index].id == value.id) {
                                    setState(() {
                                      seatsList[index].isSelected = true;

                                      calculateSelectedSeatCount();
                                      calculateSelectedSeatTotalPrice();
                                    });
                                  }
                                }
                              }
                            },

                            /// Seat View
                            child: SeatView(seat: seatsList[index]),
                          );
                        },
                        itemCount: seatsList.length),
                  ),
                ),
              )
            ],
          ),
        ),

        /// Seat Bottom
        Align(
          alignment: Alignment.bottomCenter,
          child: SeatBottomView(
            ticketCount: ticketCount,
            totalPrice: totalPrice,
          ),
        ),
      ],
    );
  }
}

/// Seat View
class SeatView extends StatelessWidget {
  final SeatVO seat;
  const SeatView({
    super.key,
    required this.seat,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: seat.type == "available",
          child: Image.asset(
            kSeatIcon,
            width: kMargin30,
            height: kMargin30,
            color: (seat.isSelected ?? false) ? kPrimaryColor : Colors.white,
          ),
        ),
        Visibility(
          visible: seat.type == "taken",
          child: Image.asset(
            kSeatIcon,
            width: kMargin30,
            height: kMargin30,
            color: null,
          ),
        ),
        Visibility(
          visible: seat.type == "space",
          child: const SizedBox(
            width: kMargin30,
            height: kMargin30,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Visibility(
            visible: seat.type == "text",
            child: Text(
              seat.symbol ?? '',
              style: const TextStyle(
                color: kLoginPageDividerColor,
                fontSize: kTextSmall,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Seat Bottom
class SeatBottomView extends StatelessWidget {
  final int ticketCount;
  final int totalPrice;
  const SeatBottomView(
      {super.key, required this.ticketCount, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Status
        Container(
          color: kStatusBackgroundColor,
          padding: const EdgeInsets.symmetric(vertical: kMarginCardMedium2),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StatusView(
                label: "Available",
                color: kUnSelectedColor,
                isHasBorder: true,
                circleColor: Colors.white,
                isHasContainer: true,
              ),
              StatusView(
                label: "Taken",
                color: kUnSelectedColor,
                isHasBorder: true,
                circleColor: kLoginPageDividerColor,
                isHasContainer: true,
              ),
              StatusView(
                label: "Your Selection",
                color: kUnSelectedColor,
                isHasBorder: true,
                circleColor: kPrimaryColor,
                isHasContainer: true,
              ),
            ],
          ),
        ),

        const SizedBox(
          height: kMarginLarge,
        ),

        /// Zoom Control
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '-',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kUnSelectedColor,
                fontSize: kTextRegular4x,
                fontWeight: FontWeight.w700,
              ),
            ),

            /// Slider Widget View
            SliderWidgetView(),

            Text(
              '+',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kUnSelectedColor,
                fontSize: kTextRegular4x,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),

        /// Buy Ticket
        BuyTicketView(
          ticketCount: ticketCount,
          totalPrice: totalPrice,
        )
      ],
    );
  }
}

/// Slider Widget View
class SliderWidgetView extends StatefulWidget {
  const SliderWidgetView({super.key});

  @override
  State<SliderWidgetView> createState() => _SliderWidgetViewState();
}

class _SliderWidgetViewState extends State<SliderWidgetView> {
  double currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Slider.adaptive(
        value: currentSliderValue,
        max: 100,
        divisions: 10,
        label: currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            currentSliderValue = value;
          });
        });
  }
}

/// Buy Ticket
class BuyTicketView extends StatelessWidget {
  final int ticketCount;
  final int totalPrice;
  const BuyTicketView(
      {super.key, required this.ticketCount, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kMarginMedium4, vertical: kMargin34),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    /// TODO:
                    text: "$ticketCount Tickets",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: kTextRegular3x,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const TextSpan(
                    text: "\n",
                  ),
                  TextSpan(
                    text: "${totalPrice}KS",
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: kTextRegular4x,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (ticketCount != 0 && totalPrice != 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SnackPage()),
                );
              }
            },
            child: const TicketButtonView(
              buttonName: kBuyTicketLabel,
            ),
          ),
        ],
      ),
    );
  }
}

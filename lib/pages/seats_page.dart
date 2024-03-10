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
class SeatScreenView extends StatelessWidget {
  final int timeSlotId;
  final String bookingDate;
  const SeatScreenView(
      {super.key, required this.timeSlotId, required this.bookingDate});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Image.asset(
                kSeatScreenImage,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
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
              SeatsView(
                timeSlotId: timeSlotId,
                bookingDate: bookingDate,
              ),
            ],
          ),
        ),

        /// Seat Bottom
        const Align(
          alignment: Alignment.bottomCenter,
          child: SeatBottomView(),
        ),
      ],
    );
  }
}

/// Seats
class SeatsView extends StatefulWidget {
  final int timeSlotId;
  final String bookingDate;
  const SeatsView(
      {super.key, required this.timeSlotId, required this.bookingDate});

  @override
  State<SeatsView> createState() => _SeatsViewState();
}

class _SeatsViewState extends State<SeatsView> {

  /// TODO : To Page Level Widget
  /// Model
  final TmbaModel _tmbaModel = TmbaModel();

  /// Seats
  dynamic seatFlatten;
  List<SeatVO>? seat;

  HashSet selectedSeat = HashSet();

  @override
  void initState() {
    super.initState();

    print(widget.timeSlotId);
    print(widget.bookingDate);

    UserVO? userDataFromDatabase = _tmbaModel.getUserDataFromDatabase();

    /// Seating Plan
    _tmbaModel
        .getSeatingPlan(userDataFromDatabase?.token ?? '', widget.timeSlotId,
            widget.bookingDate)
        .then((seatList) {
      seatFlatten = seatList.flattened;
      seat?.add(seatFlatten);
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      maxScale: kMargin5,
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Padding(
          padding: const EdgeInsets.only(bottom: kMarginMedium3),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 14,
                crossAxisSpacing: kMargin5,
                mainAxisSpacing: kMargin10,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectedSeat.contains(index)) {
                        selectedSeat.remove(index);
                      } else {
                        selectedSeat.add(index);
                      }
                    });
                  },
                  child: Stack(
                    children: [
                      Visibility(
                        visible: seat?[index].type == "available",
                        child: Image.asset(
                          kSeatIcon,
                          width: kMargin30,
                          height: kMargin30,
                          color: selectedSeat.contains(index)
                              ? kPrimaryColor
                              : Colors.white,
                        ),
                      ),
                      Visibility(
                        visible: seat?[index].type == "taken",
                        child: Image.asset(
                          kSeatIcon,
                          width: kMargin30,
                          height: kMargin30,
                          color: null,
                        ),
                      ),
                      Visibility(
                        visible: seat?[index].type == "space",
                        child: const SizedBox(
                          width: kMargin30,
                          height: kMargin30,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Visibility(
                          visible: seat?[index].type == "text",
                          child: Text(
                            seat?[index].seatName ?? '',
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
                  ),
                );
              },
              itemCount: seat?.length),
        ),
      ),
    );
  }
}

/// Seat Bottom
class SeatBottomView extends StatelessWidget {
  const SeatBottomView({super.key});

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
        const BuyTicketView()
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
class BuyTicketView extends StatefulWidget {
  const BuyTicketView({super.key});

  @override
  State<BuyTicketView> createState() => _BuyTicketViewState();
}

class _BuyTicketViewState extends State<BuyTicketView> {
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
              text: const TextSpan(
                children: [
                  TextSpan(
                    /// TODO:
                    text: "2 Tickets",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: kTextRegular3x,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: "\n",
                  ),
                  TextSpan(
                    text: "17000KS",
                    style: TextStyle(
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SnackPage()),
              );
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

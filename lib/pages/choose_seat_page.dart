import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/vos/seat_vo.dart';
import 'package:the_movie_booking_app/list_items/status_view.dart';
import 'package:the_movie_booking_app/list_items/ticket_button_view.dart';
import 'package:the_movie_booking_app/network/responses/get_seating_plan_response.dart';
import 'package:the_movie_booking_app/pages/snack_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';
import 'package:the_movie_booking_app/utils/strings.dart';

class ChooseSeatPage extends StatelessWidget {
  const ChooseSeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SeatScreenView(),
      ),
    );
  }
}

/// Seat Screen
class SeatScreenView extends StatelessWidget {
  const SeatScreenView({super.key});

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
              const SeatsView(),
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
  const SeatsView({super.key});

  @override
  State<SeatsView> createState() => _SeatsViewState();
}

class _SeatsViewState extends State<SeatsView> {
  GetSeatingPlanResponse? seats;
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
              crossAxisCount: 12,
              crossAxisSpacing: kMargin5,
              mainAxisSpacing: kMargin10,
            ),
            itemBuilder: (context, index) {

              // TODO:
              dynamic seat;
              seats?.data?.map((e) => e.map((ee) => seat = ee).toList()).toList();
              return GestureDetector(
                onTap: () {},
                child: Stack(
                  children: [
                    Visibility(
                      visible: seat.type == "available",
                      child: Image.asset(
                        kSeatIcon,
                        width: kMargin30,
                        height: kMargin30,
                        color: Colors.white,
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
                    Align(
                      alignment: Alignment.center,
                      child: Visibility(
                        visible: seat.type == "text",
                        child: Text(
                          seat.text,
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
            // TODO:
            // itemCount: seats?.length,
          ),
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
        }
    );
  }
}

/// Buy Ticket
class BuyTicketView extends StatelessWidget {
  const BuyTicketView({super.key});

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
                MaterialPageRoute(
                    builder: (context) => const SnackPage()),
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

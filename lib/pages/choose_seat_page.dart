import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/seat_vo.dart';
import 'package:the_movie_booking_app/list_items/status_view.dart';
import 'package:the_movie_booking_app/list_items/ticket_button_view.dart';
import 'package:the_movie_booking_app/pages/food_and_beverage_all_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';
import 'package:zoom_widget/zoom_widget.dart';

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
                  padding: EdgeInsets.only(top: 8, left: 8),
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 28,
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
                    color: Color(0xFF888888),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SeatsView(),
            ],
          ),
        ),
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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 12,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            SeatVO seat = seatList[index];
            return GestureDetector(
              onTap: () {},
              child: Stack(
                children: [
                  Visibility(
                    visible:
                        seat.type == "taken" || seat.type == "available",
                    child: Image.asset(
                      kSeatIcon,
                      width: kMargin30,
                      height: kMargin30,
                      color: seat.type == "available" ? Colors.white : null,
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
                          fontSize: 12,
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
          itemCount: seatList.length,
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
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StatusView(
                label: "Available",
                color: kBottomNavigationUnSelectedColor,
                isHasBorder: true,
                circleColor: Colors.white,
                isHasContainer: true,
              ),
              StatusView(
                label: "Taken",
                color: kBottomNavigationUnSelectedColor,
                isHasBorder: true,
                circleColor: kLoginPageDividerColor,
                isHasContainer: true,
              ),
              StatusView(
                label: "Your Selection",
                color: kBottomNavigationUnSelectedColor,
                isHasBorder: true,
                circleColor: kPrimaryColor,
                isHasContainer: true,
              ),
            ],
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        /// Zoom Control
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '-',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF888888),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              width: 250,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFF888888),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            const Text(
              '+',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF888888),
                fontSize: 20,
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

/// Buy Ticket
class BuyTicketView extends StatelessWidget {
  const BuyTicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 34),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "2 Tickets\n",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: "17000KS",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
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
                    builder: (context) => const FoodAndBeverageAllPage()),
              );
            },
            child: const TicketButtonView(
              buttonName: "Buy Ticket",
            ),
          ),
        ],
      ),
    );
  }
}

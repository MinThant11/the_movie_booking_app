import 'package:flutter/material.dart';

import '../list_items/ticket_button_view.dart';
import '../list_items/ticket_details_view.dart';
import '../utils/colors.dart';

class TicketDetailsPage extends StatelessWidget {
  const TicketDetailsPage({super.key});

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
                'Ticket Details',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const Stack(
          children: [
            // Padding(
            //   padding: EdgeInsets.only(left: 22, top: 12, right: 22),
            //   child: TicketDetailsView(
            //     movieName: '',
            //     posterPath: '',
            //     cinema: '',
            //     cinemaTime: '',
            //     cinemaScreen: '',
            //     bookingDate: '',
            //     seats: '',
            //     ticketCount: 0,
            //     seatTotalPrice: 0,
            //     selectedSnacksList: [],
            //     cancellationPolicyColor: Color(0xFFFF2E00),
            //   ),
            // ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: TicketDetailsBottomView(),
            )
          ],
        ),
      ),
    );
  }
}

/// Bottom
class TicketDetailsBottomView extends StatelessWidget {
  const TicketDetailsBottomView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Refund Amount\n',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: '15000KS',
                    style: TextStyle(
                      color: Color(0xFFFF2D00),
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const TicketButtonView(
              buttonName: "Cancel Booking",
              buttonColor: Color(0xFFFF2E00),
            ),
          ),
        ],
      ),
    );
  }
}

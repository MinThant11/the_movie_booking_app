import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/list_items/ticket_button_view.dart';
import 'package:the_movie_booking_app/pages/ticket_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/strings.dart';

import '../list_items/ticket_details_view.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

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
                onTap: (){
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
      body: const CheckOutScreenView(),
    );
  }
}

/// Ticket
class CheckOutScreenView extends StatelessWidget {
  const CheckOutScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: kMarginMedium4, top: kMarginCardMedium2, right: kMarginMedium4),
            child: TicketDetailsView(),
          ),
          Positioned(
            left: kMargin90,
            bottom: kMarginXLarge,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TicketPage()),
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
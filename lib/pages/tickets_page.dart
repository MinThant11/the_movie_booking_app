import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/list_items/mini_ticket_view.dart';
import 'package:the_movie_booking_app/pages/ticket_details_page.dart';

import '../utils/colors.dart';
import '../utils/dimens.dart';
import '../utils/images.dart';
import 'home_page.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: kBackgroundColor,
          surfaceTintColor: kBackgroundColor,
          actions: [
            const SearchMovieIconView(),
            const SizedBox(
              width: kMarginXLarge,
            ),
            const Icon(
              Icons.notifications,
              color: Colors.white,
              size: kMarginLarge,
            ),
            const SizedBox(
              width: kMarginMedium2,
            ),
            Image.asset(
              kScanIcon,
            ),
            const SizedBox(
              width: kHomeScreenAppBarRightMargin,
            )
          ],
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TicketDetailsPage()),
                );
              },
              child: const MiniTicketView(),
            );
          },
          itemCount: 2,
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/list_items/mini_ticket_view.dart';
import 'package:the_movie_booking_app/pages/ticket_details_page.dart';

import '../utils/colors.dart';
import '../utils/dimens.dart';
import '../utils/images.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: ListView.builder(
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
                ),
              ),
              Container(
                color: kBackgroundColor,
                child: Row(
                  children: [
                    const Spacer(),
                    const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: kMarginLarge,
                    ),
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
                      width: 56,
                      height: 56,
                    ),
                    const SizedBox(
                      width: kHomeScreenAppBarRightMargin,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

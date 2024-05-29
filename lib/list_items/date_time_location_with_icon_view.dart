import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';

import '../utils/colors.dart';

class DateTimeLocationWithIconsView extends StatelessWidget {
  final String cinemaTime;
  final String bookingDate;
  const DateTimeLocationWithIconsView(
      {super.key, required this.cinemaTime, required this.bookingDate});

  @override
  Widget build(BuildContext context) {
    DateTime tempDate = DateFormat("yyyy-MM-dd").parse(bookingDate);
    print(tempDate);
    String formatDate = DateFormat("E, d MMM, yyyy").format(tempDate);
    print(formatDate);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Date
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                color: kPrimaryColor,
              ),
              const SizedBox(
                height: kMargin10,
              ),
              Text(
                formatDate,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: kTextSmall,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),

        /// Time
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.access_time,
                color: kPrimaryColor,
              ),
              const SizedBox(
                height: kMargin10,
              ),
              Text(
                cinemaTime,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: kTextSmall,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),

        /// Location
        const Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: kPrimaryColor,
              ),
              SizedBox(
                height: kMargin10,
              ),
              Text(
                "Q5H3+JPP, Corner of, Bogyoke Lann, Yangon",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: kTextSmall,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

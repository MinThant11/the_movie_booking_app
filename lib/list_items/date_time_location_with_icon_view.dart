import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';

import '../utils/colors.dart';

class DateTimeLocationVO {
  final IconData icon;
  final String label;

  DateTimeLocationVO(this.icon, this.label);
}

class DateTimeLocationWithIconsView extends StatefulWidget {
  const DateTimeLocationWithIconsView({
    super.key,
  });

  @override
  State<DateTimeLocationWithIconsView> createState() => _DateTimeLocationWithIconsViewState();
}

class _DateTimeLocationWithIconsViewState extends State<DateTimeLocationWithIconsView> {
  List<DateTimeLocationVO> items = [
    DateTimeLocationVO(Icons.calendar_month_outlined, "Sat, 18 Jun, 2022"),
    DateTimeLocationVO(Icons.access_time, "3:30PM"),
    DateTimeLocationVO(Icons.location_on_outlined, "Q5H3+JPP, Corner of, Bogyoke Lann, Yangon"),
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item){
        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                item.icon,
                color: kPrimaryColor,
              ),
              const SizedBox(
                height: kMargin10,
              ),
              Text(
                item.label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: kTextSmall,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
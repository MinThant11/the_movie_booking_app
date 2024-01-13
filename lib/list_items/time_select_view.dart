import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';

import '../pages/choose_seat_page.dart';

class TimeSelectItems {
  Color color = Colors.white;
  String times = "";

  TimeSelectItems(this.color, this.times);
}

class TimeSelectView extends StatelessWidget {
  TimeSelectView({super.key});

  final List<TimeSelectItems> sections = [
    TimeSelectItems(const Color(0xFFFFFFFF), "9:30 AM\n3D\nScreen 1\n21 Available",),
    TimeSelectItems(const Color(0xFF00FFA3), "12:30 PM\n3D IMAX\nScreen 1",),
    TimeSelectItems(const Color(0xFFFF7A00), "12:30 PM\n3D\nScreen 2\n2 Available",),
    TimeSelectItems(const Color(0xFF00FFA3), "3:30 AM\n3D\nScreen 2",),
    TimeSelectItems(const Color(0xFFFF00B7), "6:30 AM\n3D DBOX\nScreen 2\n21 Available"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: kTimeSelectViewHeight,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: kMarginMedium3,
          mainAxisSpacing: kMarginMedium3,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChooseSeatPage()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: sections[index].color, width: 1),
                borderRadius: BorderRadius.circular(kMarginSmall),
                color: sections[index].color.withOpacity(0.1),
              ),
              child: Center(
                child: Text(
                  sections[index].times,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: kTextRegular,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: sections.length,
      ),
    );
    ;
  }
}

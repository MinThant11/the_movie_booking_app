import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/vos/time_slot_vo.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';

import '../pages/seats_page.dart';

// class TimeSelectItems {
//   Color color = Colors.white;
//   String times = "";
//
//   TimeSelectItems(this.color, this.times);
// }

class TimeSelectView extends StatelessWidget {
  final List<TimeSlotVO> timeSlot;
  final String bookingDate;
  const TimeSelectView({super.key, required this.timeSlot, required this.bookingDate});

  // final List<TimeSelectItems> sections = [
  //   TimeSelectItems(const Color(0xFFFFFFFF), "9:30 AM\n3D\nScreen 1\n21 Available",),
  //   TimeSelectItems(const Color(0xFF00FFA3), "12:30 PM\n3D IMAX\nScreen 1",),
  //   TimeSelectItems(const Color(0xFFFF7A00), "12:30 PM\n3D\nScreen 2\n2 Available",),
  //   TimeSelectItems(const Color(0xFF00FFA3), "3:30 AM\n3D\nScreen 2",),
  //   TimeSelectItems(const Color(0xFFFF00B7), "6:30 AM\n3D DBOX\nScreen 2\n21 Available"),
  // ];

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
                MaterialPageRoute(builder: (context) => SeatsPage(timeSlotId: timeSlot[index].cinemaDayTimeslotId ?? 0, bookingDate: bookingDate)),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: kAvailableColor, width: 1),
                borderRadius: BorderRadius.circular(kMarginSmall),
                color: kAvailableColor.withOpacity(0.1),
              ),
              child: Center(
                child: Text(
                  "${timeSlot[index].startTime}\n3D IMAX\nScreen ${index + 1}",
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
        itemCount: timeSlot.length,
      ),
    );
    ;
  }
}

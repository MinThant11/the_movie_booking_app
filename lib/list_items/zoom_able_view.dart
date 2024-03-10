import 'package:flutter/material.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';
import 'package:the_movie_booking_app/pages/seats_page.dart';

class ZoomableView extends StatelessWidget {
  const ZoomableView({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    return MatrixGestureDetector(
        onMatrixUpdate: (m, tm, sm, rm) {
          notifier.value = m;
        },
        child: AnimatedBuilder(
          animation: notifier,
          builder: (ctx, child) {
            return Transform(
              transform: notifier.value,
              child: const SeatsView(timeSlotId: 0, bookingDate: '',),
            );
          },
        ),
      );
  }
}
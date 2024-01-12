import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/utils/colors.dart';

import '../utils/dimens.dart';

class StatusView extends StatelessWidget {
  final String label;
  final String? icon;
  final Color color;
  final bool? isHasBorder;
  final Color? circleColor;
  final bool isHasContainer;

  const StatusView({
    super.key,
    required this.label,
    this.icon,
    required this.color,
    required this.isHasBorder,
    this.circleColor,
    required this.isHasContainer,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: !isHasContainer,
            child: Image.asset(
              (!isHasContainer) ? icon! : "",
              color: circleColor,
              width: 16,
              height: 16,
            ),
          ),
          Visibility(
            visible: isHasContainer,
            child: Container(
              width: 9,
              height: 9,
              decoration: BoxDecoration(
                color: (isHasBorder!) ? circleColor : color,
                shape: BoxShape.circle,
                border: (isHasBorder!)
                    ? Border.all(
                        color: kBottomNavigationUnSelectedColor, width: 1)
                    : null,
              ),
            ),
          ),
          const SizedBox(
            width: kMarginMedium,
          ),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: (!isHasContainer) ? kTextRegular : kTextRegular2x,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}

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
              width: kMarginMedium2,
              height: kMarginMedium2,
            ),
          ),
          Visibility(
            visible: isHasContainer,
            child: Container(
              width: kMarginSmall + kMargin5,
              height: kMarginSmall + kMargin5,
              decoration: BoxDecoration(
                color: (isHasBorder!) ? circleColor : color,
                shape: BoxShape.circle,
                border: (isHasBorder!)
                    ? Border.all(
                        color: kUnSelectedColor, width: 1)
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

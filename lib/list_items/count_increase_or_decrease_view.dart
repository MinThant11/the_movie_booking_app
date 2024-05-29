import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';

class CountIncreaseOrDecrease extends StatelessWidget {
  final int getCount;
  final Function() add;
  final Function() remove;
  const CountIncreaseOrDecrease(
      {super.key, required this.getCount, required this.add, required this.remove, });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Minus
        GestureDetector(
          onTap: remove,
          child: Container(
            width: kPlusMinusContainerSize,
            height: kPlusMinusContainerSize,
            decoration: const ShapeDecoration(
              color: kPrimaryColor,
              shape: OvalBorder(),
              shadows: [
                BoxShadow(
                  color: kBoxShadowColor,
                  blurRadius: kMargin5,
                  offset: Offset(0, kMarginMedium),
                  spreadRadius: 0,
                )
              ],
            ),
            child: const Center(
              child: Text(
                '-',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kPlusMinusColor,
                  fontSize: kTextRegular2x,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),

        /// Spacer
        const SizedBox(
          width: kMarginCardMedium2,
        ),

        /// Count
        SizedBox(
          width: kMarginMedium3,
          child: Text(
            getCount.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: kTextRegular1x,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        /// Spacer
        const SizedBox(
          width: kMarginCardMedium2,
        ),

        /// Plus
        GestureDetector(
          onTap: add,
          child: Container(
            width: kPlusMinusContainerSize,
            height: kPlusMinusContainerSize,
            decoration: const ShapeDecoration(
              color: kPrimaryColor,
              shape: OvalBorder(),
              shadows: [
                BoxShadow(
                  color: kBoxShadowColor,
                  blurRadius: kMargin5,
                  offset: Offset(0, kMarginMedium),
                  spreadRadius: 0,
                )
              ],
            ),
            child: const Center(
              child: Text(
                '+',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kPlusMinusColor,
                  fontSize: kTextRegular2x,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

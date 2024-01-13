import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';

class CountIncreaseOrDecrease extends StatefulWidget {
  const CountIncreaseOrDecrease({super.key,});

  @override
  State<CountIncreaseOrDecrease> createState() => _CountIncreaseOrDecreaseState();
}

class _CountIncreaseOrDecreaseState extends State<CountIncreaseOrDecrease> {

  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Minus
        InkWell(
          onTap: (){
            setState(() {
              if (count > 0) {
                count--;
              }
            });
          },
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
        Text(
          "$count",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: kTextRegular1x,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
        ),
        /// Spacer
        const SizedBox(
          width: kMarginCardMedium2,
        ),
        /// Plus
        InkWell(
          onTap: (){
            setState(() {
              count++;
            });
          },
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
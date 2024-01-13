import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';

import '../utils/colors.dart';
import '../utils/images.dart';

class TicketButtonView extends StatelessWidget {
  final String buttonName;
  final Color? buttonColor;
  const TicketButtonView({super.key, required this.buttonName, this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kTicketButtonWidth,
      child: Stack(
        children: [
          Image.asset(
            kBuyTicketButton,
            color: (buttonColor) != null ? buttonColor : kPrimaryColor,
            width: kTicketButtonWidth,
            height: kTicketButtonHeight,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                width: kTicketContainerWidth,
                height: kTicketButtonHeight,
                color:  (buttonColor) != null ? buttonColor : kPrimaryColor,
                child: Center(
                  child: Text(
                    buttonName,
                    style: TextStyle(
                      color: (buttonColor) != null ? Colors.white : Colors.black,
                      fontSize: kTextRegular2x,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/images.dart';

class TicketButtonView extends StatelessWidget {
  final String buttonName;
  final Color? buttonColor;
  const TicketButtonView({super.key, required this.buttonName, this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 226,
      child: Stack(
        children: [
          Image.asset(
            kBuyTicketButton,
            color: (buttonColor) != null ? buttonColor : kPrimaryColor,
            width: 226,
            height: 49,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                width: 200,
                height: 49,
                color:  (buttonColor) != null ? buttonColor : kPrimaryColor,
                child: Center(
                  child: Text(
                    buttonName,
                    style: TextStyle(
                      color: (buttonColor) != null ? Colors.white : Colors.black,
                      fontSize: 16,
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

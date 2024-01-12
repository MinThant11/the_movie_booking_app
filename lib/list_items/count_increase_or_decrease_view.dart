import 'package:flutter/material.dart';

class CountIncreaseOrDecrease extends StatefulWidget {
  const CountIncreaseOrDecrease({super.key});

  @override
  State<CountIncreaseOrDecrease> createState() => _CountIncreaseOrDecreaseState();
}

class _CountIncreaseOrDecreaseState extends State<CountIncreaseOrDecrease> {
  var count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: (){
            setState(() {
              if (count > 0) {
                count--;
              }
            });
          },
          child: Container(
            width: 23.30,
            height: 23.30,
            decoration: const ShapeDecoration(
              color: Color(0xFF00FF6A),
              shape: OvalBorder(),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4.66,
                  offset: Offset(0, 11.65),
                  spreadRadius: 0,
                )
              ],
            ),
            child: const Text(
              '-',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF555555),
                fontSize: 16.31,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
                letterSpacing: -0.39,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 14,
        ),
        Text(
          "$count",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF00FF6A),
            fontSize: 14.91,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          width: 14,
        ),
        InkWell(
          onTap: (){
            setState(() {
              count++;
            });
          },
          child: Container(
            width: 23.30,
            height: 23.30,
            decoration: const ShapeDecoration(
              color: Color(0xFF00FF6A),
              shape: OvalBorder(),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4.66,
                  offset: Offset(0, 11.65),
                  spreadRadius: 0,
                )
              ],
            ),
            child: const Text(
              '+',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF555555),
                fontSize: 16.31,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
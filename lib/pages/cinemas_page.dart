import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CinemasPage extends StatelessWidget {
  const CinemasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Text(
          "Cinemas Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

import 'package:digital_expenz_tracker/constants/colors.dart';
import 'package:flutter/material.dart';

class Frontpage extends StatelessWidget {
  const Frontpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/logo.png", width: 150, fit: BoxFit.cover),
        const SizedBox(
          height: 20,
        ),
        const Center(
          child: Text(
            "Plant safe",
            style: TextStyle(
                fontSize: 35, color: kMainColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

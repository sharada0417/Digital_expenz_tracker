import 'package:digital_expenz_tracker/constants/colors.dart';
import 'package:digital_expenz_tracker/constants/constants.dart';
import 'package:flutter/material.dart';

class SharedOnboardingScreen extends StatelessWidget {
  final String title;
  final String imagepath;
  final String description;
  const SharedOnboardingScreen(
      {super.key,
      required this.title,
      required this.imagepath,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultpadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagepath,
            width: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 16, color: kBlack, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            style: const TextStyle(
                fontSize: 16, color: kGrey, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

import 'package:digital_expenz_tracker/constants/colors.dart';
import 'package:digital_expenz_tracker/data/onboardingdata.dart';
import 'package:digital_expenz_tracker/screens/onboarding/Frontpage.dart';
import 'package:digital_expenz_tracker/screens/onboarding/shared_onboarding_screen.dart';
import 'package:digital_expenz_tracker/screens/user_data_screen.dart';
import 'package:digital_expenz_tracker/widgets/Custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool showDetailsPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  showDetailsPage = index == 3;
                });
              },
              children: [
                const Frontpage(),
                SharedOnboardingScreen(
                    title: Onboardingdata.onboardingDataList[0].title,
                    imagepath: Onboardingdata.onboardingDataList[0].imagepath,
                    description:
                        Onboardingdata.onboardingDataList[0].description),
                SharedOnboardingScreen(
                    title: Onboardingdata.onboardingDataList[1].title,
                    imagepath: Onboardingdata.onboardingDataList[1].imagepath,
                    description:
                        Onboardingdata.onboardingDataList[1].description),
                SharedOnboardingScreen(
                    title: Onboardingdata.onboardingDataList[2].title,
                    imagepath: Onboardingdata.onboardingDataList[2].imagepath,
                    description:
                        Onboardingdata.onboardingDataList[2].description),
              ],
            ),
            Container(
              alignment: const Alignment(0, 0.60),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 4,
                effect: const WormEffect(
                    activeDotColor: kMainColor, dotColor: kLightGrey),
              ),
            ),
            //navigation button
            Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: !showDetailsPage
                        ? GestureDetector(
                            onTap: () {
                              _controller.animateToPage(
                                  _controller.page!.toInt() + 1,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut);
                            },
                            child: CustomButton(
                                buttonName:
                                    showDetailsPage ? "Get Started" : "Next",
                                buttonColor: kMainColor),
                          )
                        : GestureDetector(
                            onTap: () {
                              //NAVIGATE TO THE USER DATA PAGE
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const UserDataScreen()));
                            },
                            child: CustomButton(
                                buttonName:
                                    showDetailsPage ? "Get Started" : "Next",
                                buttonColor: kMainColor),
                          )))
          ],
        ))
      ],
    ));
  }
}

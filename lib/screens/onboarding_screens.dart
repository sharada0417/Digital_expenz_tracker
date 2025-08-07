import 'package:digital_expenz_tracker/constants/colors.dart';
import 'package:digital_expenz_tracker/data/Onboardingdata.dart';
import 'package:digital_expenz_tracker/screens/onbording/Frontpage.dart';
import 'package:digital_expenz_tracker/screens/onbording/shared_onboarding_screen.dart';
import 'package:digital_expenz_tracker/screens/user_data_screen.dart';
import 'package:digital_expenz_tracker/widgets/Custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final PageController _controller = PageController();
  bool showDetailsPage = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.hasClients && _controller.page == 3 && !showDetailsPage) {
        setState(() {
          showDetailsPage = true;
        });
      } else if (_controller.hasClients &&
          _controller.page! < 3 &&
          showDetailsPage) {
        setState(() {
          showDetailsPage = false;
        });
      }
    });
  }

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
                  children: [
                    const Frontpage(),
                    SharedOnboardingScreen(
                        title: Onboardingdata.onboardingDataList[0].title,
                        imagepath:
                            Onboardingdata.onboardingDataList[0].imagepath,
                        description:
                            Onboardingdata.onboardingDataList[0].description),
                    SharedOnboardingScreen(
                        title: Onboardingdata.onboardingDataList[1].title,
                        imagepath:
                            Onboardingdata.onboardingDataList[1].imagepath,
                        description:
                            Onboardingdata.onboardingDataList[1].description),
                    SharedOnboardingScreen(
                        title: Onboardingdata.onboardingDataList[2].title,
                        imagepath:
                            Onboardingdata.onboardingDataList[2].imagepath,
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
                      activeDotColor: kMainColor,
                      dotColor: kLightGrey,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: GestureDetector(
                      onTap: () {
                        if (showDetailsPage) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserDataScreen(),
                            ),
                          );
                        } else {
                          final currentPage = _controller.hasClients
                              ? _controller.page?.round() ?? 0
                              : 0;
                          _controller.animateToPage(
                            currentPage + 1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: CustomButton(
                        buttonName: showDetailsPage ? "Get Started" : "Next",
                        buttonColor: kMainColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:digital_expenz_tracker/constants/colors.dart';
import 'package:digital_expenz_tracker/constants/constants.dart';
import 'package:digital_expenz_tracker/screens/onboarding_screens.dart';
import 'package:digital_expenz_tracker/services/expense_service.dart';
import 'package:digital_expenz_tracker/services/income_service.dart';
import 'package:digital_expenz_tracker/services/userService.dart';
import 'package:digital_expenz_tracker/widgets/profile_card.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = "";
  String email = "";

  @override
  void initState() {
    UserServices.getUserData().then((value) {
      if (value['username'] != null && value['email'] != null) {
        userName = value['username']!;
        email = value['email']!;
      }
    });
    super.initState();
  }

//open sacffold messengervfor logout
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: kWhite,
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            padding: const EdgeInsets.all(kDefaultpadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Are you sure you want to logout?",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500, color: kBlack),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(kGreen),
                        ),
                        onPressed: () async {
                          //clear the user data
                          await UserServices.clearUserData();
                          //clear all expenses and incomes
                          if (context.mounted) {
                            await ExpenseService().deleteAllExpenses(context);
                            await IncomeService().deleteAllIncomes(context);

                            //navigation to the onboarding screen
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OnboardingScreens(),
                              ),
                              (route) => false,
                            );
                          }
                        },
                        child: const Text(
                          "Yes",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: kWhite),
                        )),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(kRed),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "No",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: kWhite),
                        ))
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: kMainColor,
                          border: Border.all(
                            color: kMainColor,
                            width: 3,
                          )),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/images/user.jpg",
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "welcome $userName",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          email,
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: kGrey),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: kMainColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(Icons.edit,
                              color: kMainColor, size: 30)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const ProfileCard(
                    icon: Icons.wallet, title: "My wallet", color: kMainColor),
                const ProfileCard(
                    icon: Icons.settings, title: "Settings", color: kMainColor),
                const ProfileCard(
                    icon: Icons.download,
                    title: "Export data",
                    color: kMainColor),
                GestureDetector(
                  onTap: () {
                    _showBottomSheet(context);
                  },
                  child: const ProfileCard(
                      icon: Icons.logout, title: "Log out", color: kMainColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

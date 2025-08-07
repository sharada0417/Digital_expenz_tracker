import 'package:digital_expenz_tracker/constants/colors.dart';
import 'package:digital_expenz_tracker/services/userService.dart';
import 'package:digital_expenz_tracker/widgets/income_expence_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //for store the username
  String username = "";

  @override
  void initState() {
    //get the user name from the shared pref
    UserServices.getUserData().then((value) {
      if (value["username"] != null) {
        setState(() {
          username = value['username']!;
          print(username);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          //main column
          child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
                color: kMainColor.withOpacity(0.15),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )),
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
                        width: 20,
                      ),
                      Text(
                        "welcome $username",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications,
                            color: kMainColor, size: 30),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IncomeExpenceCard(
                          title: "Income",
                          amount: 500,
                          imageUrl: "assets/images/income.png",
                          bgColor: kGreen),
                      IncomeExpenceCard(
                          title: "Income",
                          amount: 500,
                          imageUrl: "assets/images/expense.png",
                          bgColor: kRed),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    ));
  }
}

import 'package:digital_expenz_tracker/constants/colors.dart';
import 'package:digital_expenz_tracker/constants/constants.dart';
import 'package:digital_expenz_tracker/widgets/Custom_button.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserState();
}

class _UserState extends State<UserDataScreen> {
  //for the check box
  bool _remberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultpadding),
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Enter your personal \nDeatails ",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //form feild for the user name
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //form feild for the Email
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //form feild for the password
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //form feild for the conform password
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //remeber me for the next time
                  Row(
                    children: [
                      const Text(
                        "remeber me for the next time",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: kGrey),
                      ),
                      Expanded(
                          child: CheckboxListTile(
                              activeColor: kMainColor,
                              value: _remberMe,
                              onChanged: (value) {
                                setState(() {
                                  _remberMe = true;
                                });
                              })),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomButton(
                      buttonName: "Next", buttonColor: kMainColor)
                ],
              ))
            ],
          )),
        ),
      ),
    );
  }
}

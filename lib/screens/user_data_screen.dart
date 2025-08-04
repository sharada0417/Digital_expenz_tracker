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

  //form key the form validation
  final _formkey = GlobalKey<FormState>();

  //controllers for the text form feilds
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ConformPasswordController =
      TextEditingController();
  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _ConformPasswordController.dispose();
  }

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
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //form feild for the user name
                      TextFormField(
                        controller: _userNameController,
                        validator: (value) {
                          //check weather the user enter username is empty
                          if (value!.isEmpty) {
                            return "Please enter your name ";
                          }
                          return null;
                        },
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
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your email";
                          }
                          return null;
                        },
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
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter a valid password";
                          }
                          return null;
                        },
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
                        controller: _ConformPasswordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter the valid password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: 'Conform Password',
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
                                      _remberMe = value!;
                                    });
                                  })),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            //form is valid process data
                            String username = _userNameController.text;
                            String Email = _emailController.text;
                            String password = _passwordController.text;
                            String conformpassword =
                                _ConformPasswordController.text;
                            print(
                                "$username $Email $password $conformpassword");
                          }
                        },
                        child: const CustomButton(
                            buttonName: "Next", buttonColor: kMainColor),
                      )
                    ],
                  ))
            ],
          )),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  //method to store the user name and user email in shared pref
  static Future<void> storeUserDetails({
    required String userName,
    required String email,
    required String password,
    required String conformPassword,
    required BuildContext context,
  }) async {
    //check weather the user entered password and the confirm password the same
    if (password != conformPassword) {
      //show a message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Password and confirm password do not match")),
      );
    }

    try {
      //create an instance from shared pref
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //store the user name and email as key value pairs
      await prefs.setString("username", userName);
      await prefs.setString("email", email);

      //show a message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("User Details stored sucessfully"),
        ),
      );
      return;
    } catch (err) {
      err.toString();
    }
  }

  //method to cjheck user name is save in shared preferences
  static Future<bool> checkusername() async {
    //create instance fo shared pref
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString('username');
    return userName != null;
  }
}

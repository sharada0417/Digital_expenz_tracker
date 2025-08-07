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
    //if the users password and conf paswword are same then store the users name and email
    try {
      //check weather the user entered password and the confirm password the same
      if (password != conformPassword) {
        //show a message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text("Password and confirm password do not match")),
        );
      }
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
}

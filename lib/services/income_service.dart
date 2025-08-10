import 'dart:convert';

import 'package:digital_expenz_tracker/models/income_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomeService {
  //Define the key for storing incomes in shared preferences
  static const String _incomeKey = 'income';

  //save the income to shared preferences

  Future<void> saveIncome(IncomeModel income, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      List<String>? existingIncomes = prefs.getStringList(_incomeKey);

      //convert the exisiting incomes to a list of Income objects
      List<IncomeModel> exisitingIncomeObjects = [];

      if (existingIncomes != null) {
        exisitingIncomeObjects = existingIncomes
            .map((e) => IncomeModel.fromJSON(json.decode(e)))
            .toList();
      }

      //Add the new income to the list
      exisitingIncomeObjects.add(income);

      //convert the list of Income objects back to a List of Strings
      List<String> updateIncome =
          exisitingIncomeObjects.map((e) => json.encode(e.toJSON())).toList();

      //save the updated list of incomes to shared preference
      await prefs.setStringList(_incomeKey, updateIncome);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Income added sucessfully"),
          duration: Duration(seconds: 2),
        ));
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Error on Adding Income!"),
        duration: Duration(seconds: 2),
      ));
    }
  }

  //load the income from shared preferences
  Future<List<IncomeModel>> loadIncomes() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? existingIncomes = pref.getStringList(_incomeKey);

    //convert the existing incomes to a lsit of income objects
    List<IncomeModel> loadedIcomes = [];
    if (existingIncomes != null) {
      loadedIcomes = existingIncomes
          .map((e) => IncomeModel.fromJSON(json.decode(e)))
          .toList();
    }
    return loadedIcomes;
  }
}

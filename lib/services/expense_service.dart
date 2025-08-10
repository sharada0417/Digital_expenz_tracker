import 'dart:convert';

import 'package:digital_expenz_tracker/models/Expenz_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenseService {
  //expense List
  // List<Expense> expenseList = [];

  //Define the key for storing expences in shared preferences
  static const String _expenseKey = 'expences';

  //save the expense to shared preferences
  Future<void> saveExpenses(Expense expense, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? existingExpenses = prefs.getStringList(_expenseKey);

      //convert the exisiting expenses to a list of Expense objects
      List<Expense> existingExpenseObjects = [];

      if (existingExpenses != null) {
        existingExpenseObjects = existingExpenses
            .map((e) => Expense.fromJSON(json.decode(e)))
            .toList();
      }

      //Add the new expense to the list
      existingExpenseObjects.add(expense);

      //convert the list of expense objects back to a list of strings
      List<String> updatedExpenses =
          existingExpenseObjects.map((e) => json.encode(e.toJSON())).toList();

      //save the update list of expenses to shared preferences
      await prefs.setStringList(_expenseKey, updatedExpenses);

      //show message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Expenses added sucessfully!"),
          duration: Duration(seconds: 2),
        ));
      }
    } catch (error) {
      //show message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Error on Adding Expenses!"),
          duration: Duration(seconds: 2),
        ));
      }
    }
  }

  //Load the Expense from shared preferences
  Future<List<Expense>> loadExpenses() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? existingExpenses = pref.getStringList(_expenseKey);

    //convert the existing expenses to a list of Expense objects
    List<Expense> lodedExpense = [];
    if (existingExpenses != null) {
      lodedExpense = existingExpenses
          .map((e) => Expense.fromJSON(json.decode(e)))
          .toList();
    }
    return lodedExpense;
  }
}

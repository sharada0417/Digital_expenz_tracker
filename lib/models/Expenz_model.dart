//enum for expense categories
import 'package:flutter/rendering.dart';

enum ExpenceCategory {
  food,
  transaport,
  health,
  shopping,
  subscriptions,
}

//categories images
final Map<ExpenceCategory, String> expenseCategoriesImages = {
  ExpenceCategory.food: "assets/images/restaurant.png",
  ExpenceCategory.transaport: "assets/images/car.png",
  ExpenceCategory.health: "assets/images/health.png",
  ExpenceCategory.shopping: "assets/images/bag.png",
  ExpenceCategory.subscriptions: "assets/images/bill.png",
};

//cateogry colors
final Map<ExpenceCategory, Color> expenseCategoriesColors = {
  ExpenceCategory.food: const Color(0xFFE57373),
  ExpenceCategory.transaport: const Color(0xFF81C784),
  ExpenceCategory.health: const Color(0xFF64B5F6),
  ExpenceCategory.shopping: const Color(0xFFFFD54F),
  ExpenceCategory.subscriptions: const Color(0xFF9575CD),
};

//model
class Expense {
  final int id;
  final String title;
  final double amount;
  final ExpenceCategory category;
  final DateTime date;
  final DateTime time;
  final String description;

  Expense(
      {required this.id,
      required this.title,
      required this.amount,
      required this.category,
      required this.date,
      required this.time,
      required this.description});

  //convert the expense object to a json object
  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'category': category.index,
      'date': date.toIso8601String(),
      'time': time.toIso8601String(),
      'description': description,
    };
  }

  //Create an Expense object from a JSON object
  factory Expense.fromJSON(Map<String, dynamic> json) {
    return Expense(
      id: json['id'],
      title: json['title'],
      amount: json['amount'],
      category: ExpenceCategory.values[json['category']],
      date: DateTime.parse(json['date']),
      time: DateTime.parse(json['time']),
      description: json['description'],
    );
  }
}

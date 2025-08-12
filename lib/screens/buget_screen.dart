import 'package:digital_expenz_tracker/constants/colors.dart';
import 'package:digital_expenz_tracker/constants/constants.dart';
import 'package:digital_expenz_tracker/models/Expenz_model.dart';
import 'package:digital_expenz_tracker/models/income_model.dart';
import 'package:digital_expenz_tracker/widgets/category_card.dart';
import 'package:digital_expenz_tracker/widgets/pie_chart.dart';
import 'package:flutter/material.dart';

class BugetScreen extends StatefulWidget {
  final Map<ExpenceCategory, double> expenseCategoryTotals;
  final Map<IncomeCategory, double> incomeCategoryTotals;

  const BugetScreen(
      {super.key,
      required this.expenseCategoryTotals,
      required this.incomeCategoryTotals});

  @override
  State<BugetScreen> createState() => _BugetScreenState();
}

class _BugetScreenState extends State<BugetScreen> {
  int _seletedOption = 0; // 0 = Income, 1 = Expense

  //method to find the category color from the category
  Color getCategoryColor(dynamic category) {
    if (category is ExpenceCategory) {
      return expenseCategoriesColors[category]!;
    } else {
      return incomeCategoryColor[category]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = _seletedOption == 0
        ? widget.expenseCategoryTotals
        : widget.incomeCategoryTotals;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Financial Report",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: kBlack,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultpadding,
                  vertical: kDefaultpadding / 2,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: kBlack.withOpacity(0.1),
                    boxShadow: [
                      BoxShadow(
                        color: kBlack.withOpacity(0.1),
                        blurRadius: 20,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Expense Button
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _seletedOption = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: _seletedOption == 1 ? kWhite : kRed,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 60),
                            child: Text(
                              "Expense",
                              style: TextStyle(
                                color: _seletedOption == 1 ? kBlack : kWhite,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Income Button
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _seletedOption = 0;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: _seletedOption == 0 ? kWhite : kGreen,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 60),
                            child: Text(
                              "Income",
                              style: TextStyle(
                                color: _seletedOption == 0 ? kBlack : kWhite,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //pie shart
              chart(
                  expenseCategoryTotals: widget.expenseCategoryTotals,
                  incomeCategoryTotails: widget.incomeCategoryTotals,
                  isExpense: _seletedOption == 0),
              const SizedBox(
                height: 20,
              ), //list of categories
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final cateogry = data.keys.toList()[index];
                      final total = data.values.toList()[index];
                      return CategoryCard(
                          title: cateogry.name,
                          amount: total,
                          total: data.values
                              .reduce((value, element) => value + element),
                          progressColor: getCategoryColor(cateogry),
                          isExpense: _seletedOption == 0);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:digital_expenz_tracker/constants/colors.dart';
import 'package:digital_expenz_tracker/constants/constants.dart';
import 'package:digital_expenz_tracker/models/Expenz_model.dart';
import 'package:digital_expenz_tracker/models/income_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class chart extends StatefulWidget {
  final Map<ExpenceCategory, double> expenseCategoryTotals;
  final Map<IncomeCategory, double> incomeCategoryTotails;
  final bool isExpense;
  const chart(
      {super.key,
      required this.expenseCategoryTotals,
      required this.incomeCategoryTotails,
      required this.isExpense});

  @override
  State<chart> createState() => _chartState();
}

class _chartState extends State<chart> {
  //selections data
  List<PieChartSectionData> getSections() {
    if (widget.isExpense) {
      return [
        PieChartSectionData(
          color: expenseCategoriesColors[ExpenceCategory.bills],
          value: widget.expenseCategoryTotals[ExpenceCategory.bills] ?? 0,
          radius: 60,
        ),
        PieChartSectionData(
          color: expenseCategoriesColors[ExpenceCategory.crypto],
          value: widget.expenseCategoryTotals[ExpenceCategory.crypto] ?? 0,
          radius: 60,
        ),
        PieChartSectionData(
          color: expenseCategoriesColors[ExpenceCategory.subscriptions],
          value:
              widget.expenseCategoryTotals[ExpenceCategory.subscriptions] ?? 0,
          radius: 60,
        ),
        PieChartSectionData(
          color: expenseCategoriesColors[ExpenceCategory.stockmarket],
          value: widget.expenseCategoryTotals[ExpenceCategory.stockmarket] ?? 0,
          radius: 60,
        ),
      ];
    } else {
      return [
        PieChartSectionData(
          color: incomeCategoryColor[IncomeCategory.freelance],
          value: widget.incomeCategoryTotails[IncomeCategory.freelance] ?? 0,
          radius: 60,
        ),
        PieChartSectionData(
          color: incomeCategoryColor[IncomeCategory.passive],
          value: widget.incomeCategoryTotails[IncomeCategory.passive] ?? 0,
          radius: 60,
        ),
        PieChartSectionData(
          color: incomeCategoryColor[IncomeCategory.salary],
          value: widget.incomeCategoryTotails[IncomeCategory.passive] ?? 0,
          radius: 60,
        ),
        PieChartSectionData(
          color: incomeCategoryColor[IncomeCategory.sales],
          value: widget.incomeCategoryTotails[IncomeCategory.sales] ?? 0,
          radius: 60,
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final PieChartData pieChartData = PieChartData(
      sectionsSpace: 0,
      centerSpaceRadius: 70,
      startDegreeOffset: -90,
      sections: getSections(),
      borderData: FlBorderData(show: false),
    );
    return Container(
      height: 250,
      padding: const EdgeInsets.all(kDefaultpadding),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(pieChartData),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "70%",
                style: TextStyle(
                  color: kBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "of 100%",
                style: TextStyle(color: kGrey),
              )
            ],
          )
        ],
      ),
    );
  }
}

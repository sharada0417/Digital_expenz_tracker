import 'package:digital_expenz_tracker/constants/colors.dart';
import 'package:digital_expenz_tracker/constants/constants.dart';
import 'package:digital_expenz_tracker/models/Expenz_model.dart';
import 'package:digital_expenz_tracker/models/income_model.dart';
import 'package:digital_expenz_tracker/widgets/expense_card.dart';
import 'package:digital_expenz_tracker/widgets/income_card.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  final List<Expense> expensesList;
  final List<IncomeModel> incomeList;
  final void Function(Expense) onDismissedExpense;
  final void Function(IncomeModel) onDismissedIncome;

  // Constructor requires all 4 parameters
  const TransactionScreen({
    super.key,
    required this.expensesList,
    required this.onDismissedExpense,
    required this.incomeList,
    required this.onDismissedIncome,
  });

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(kDefaultpadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "see your fincial Report",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500, color: kMainColor),
            ),
            const SizedBox(height: 20),
            const Text(
              "Expenses",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: kBlack),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    widget.expensesList.isEmpty
                        ? const Text(
                            "No expense added yet , add some expenses to see here",
                            style: TextStyle(fontSize: 16, color: kGrey),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.expensesList.length,
                            itemBuilder: (context, index) {
                              final expense = widget.expensesList[index];
                              return Dismissible(
                                key: ValueKey(expense),
                                direction: DismissDirection.startToEnd,
                                onDismissed: (direction) {
                                  setState(() {
                                    widget.onDismissedExpense(expense);
                                  });
                                },
                                child: ExpenseCard(
                                    title: expense.title,
                                    date: expense.date,
                                    amount: expense.amount,
                                    category: expense.category,
                                    description: expense.description,
                                    time: expense.time),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Incomes",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: kBlack),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    widget.expensesList.isEmpty
                        ? const Text(
                            "No Income added yet , add some Income to see here",
                            style: TextStyle(fontSize: 16, color: kGrey),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.incomeList.length,
                            itemBuilder: (context, index) {
                              final income = widget.incomeList[index];
                              return Dismissible(
                                key: ValueKey(income),
                                direction: DismissDirection.startToEnd,
                                onDismissed: (direction) {
                                  setState(() {
                                    widget.onDismissedIncome(income);
                                  });
                                },
                                child: IncomeCard(
                                    title: income.title,
                                    date: income.date,
                                    amount: income.amount,
                                    category: income.category,
                                    description: income.description,
                                    time: income.time),
                              );
                            },
                          ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

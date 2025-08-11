import 'package:digital_expenz_tracker/constants/colors.dart';
import 'package:digital_expenz_tracker/constants/constants.dart';
import 'package:digital_expenz_tracker/models/Expenz_model.dart';
import 'package:digital_expenz_tracker/widgets/expense_card.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  final List<Expense> expensesList;
  final void Function(Expense) onDismissedExpense;
  const TransactionScreen(
      {super.key,
      required this.expensesList,
      required this.onDismissedExpense});

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
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Expenses",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: kBlack),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
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
                    )
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

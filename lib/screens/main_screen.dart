import 'package:digital_expenz_tracker/constants/colors.dart';
import 'package:digital_expenz_tracker/models/Expenz_model.dart';
import 'package:digital_expenz_tracker/models/income_model.dart';
import 'package:digital_expenz_tracker/screens/Transaction_screen.dart';
import 'package:digital_expenz_tracker/screens/add_new_screen.dart';
import 'package:digital_expenz_tracker/screens/buget_screen.dart';
import 'package:digital_expenz_tracker/screens/home_screen.dart';
import 'package:digital_expenz_tracker/screens/profile_screen.dart';
import 'package:digital_expenz_tracker/services/expense_service.dart';
import 'package:digital_expenz_tracker/services/income_service.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //current page index
  int _currentPageIndex = 0;

  List<Expense> expenseList = [];
  List<IncomeModel> incomeList = [];

  //function to fetch expences
  void fetchAllExpences() async {
    List<Expense> lodedExpenses = await ExpenseService().loadExpenses();
    setState(() {
      expenseList = lodedExpenses;
    });
  }

  //function to fetch all incomes
  void fetchAllIncome() async {
    List<IncomeModel> loadedIncome = await IncomeService().loadIncomes();
    setState(() {
      incomeList = loadedIncome;
      print(expenseList.length);
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      fetchAllExpences();
      fetchAllIncome();
    });
  }

  //function to add a new expense
  void addNewExpense(Expense newExpense) {
    ExpenseService().saveExpenses(newExpense, context);

    //update the list of expenses
    setState(() {
      expenseList.add(newExpense);
      print(expenseList.length);
    });
  }

  //function to add new income
  void addNewIncome(IncomeModel newIncome) {
    IncomeService().saveIncome(newIncome, context);

    //updated the income List
    setState(() {
      incomeList.add(newIncome);
      print(incomeList.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomeScreen(),
      const TransactionScreen(),
      AddNewScreen(
        addExpense: addNewExpense,
        addIncome: addNewIncome,
      ),
      const BugetScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: kWhite,
          selectedItemColor: kMainColor,
          unselectedItemColor: kGrey,
          currentIndex: _currentPageIndex,
          onTap: (index) {
            setState(() {
              _currentPageIndex = index;
              print(_currentPageIndex);
            });
          },
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_rounded), label: "Transaction"),
            BottomNavigationBarItem(
              icon: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: kMainColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: kWhite,
                    size: 30,
                  )),
              label: "",
            ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.rocket), label: "Budget"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Profile"),
          ]),
      body: pages[_currentPageIndex],
    );
  }
}

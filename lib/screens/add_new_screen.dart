import 'package:digital_expenz_tracker/constants/colors.dart';
import 'package:digital_expenz_tracker/constants/constants.dart';
import 'package:digital_expenz_tracker/models/Expenz_model.dart';
import 'package:digital_expenz_tracker/models/income_model.dart';
import 'package:flutter/material.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  //state to track the expence or income
  int _selectedMethod = 0;
  ExpenceCategory _expenceCategory = ExpenceCategory.health;
  IncomeCategory _incomeCategory = IncomeCategory.salary;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedMethod == 0 ? kRed : kGreen,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: kDefaultpadding, horizontal: kDefaultpadding),
          child: Stack(
            children: [
              //Expence and income toggle menu
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMethod = 0;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _selectedMethod == 0 ? kRed : kWhite,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            child: Text(
                              "Expense",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: _selectedMethod == 0 ? kWhite : kBlack,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMethod = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _selectedMethod == 1 ? kGreen : kWhite,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            child: Text(
                              "Income",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      _selectedMethod == 1 ? kWhite : kBlack),
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
              //Amount
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultpadding),
                child: Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "How much",
                        style: TextStyle(
                            color: kLightGrey.withOpacity(0.8),
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      const TextField(
                        style: TextStyle(
                          fontSize: 60,
                          color: kWhite,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                            hintText: "0",
                            hintStyle: TextStyle(
                                color: kWhite,
                                fontSize: 60,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              ),
              //user data form
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3,
                ),
                decoration: const BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    child: Column(
                      children: [
                        //category slector dropdown
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20)),
                            items: _selectedMethod == 0
                                ? ExpenceCategory.values.map((category) {
                                    return DropdownMenuItem(
                                      value: category,
                                      child: Text(category.name),
                                    );
                                  }).toList()
                                : IncomeCategory.values.map((category) {
                                    return DropdownMenuItem(
                                      value: category,
                                      child: Text(category.name),
                                    );
                                  }).toList(),
                            value: _selectedMethod == 0
                                ? _expenceCategory
                                : _incomeCategory,
                            onChanged: (value) {
                              setState(() {
                                _selectedMethod == 0
                                    ? _expenceCategory =
                                        value as ExpenceCategory
                                    : _incomeCategory = value as IncomeCategory;
                              });
                            }),
                        const SizedBox(
                          height: 10,
                        ),

                        //title controller
                        TextFormField(
                          controller: _titleController,
                          decoration: InputDecoration(
                              hintText: "Title",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //description controller
                        TextFormField(
                          controller: _descriptionController,
                          decoration: InputDecoration(
                              hintText: "Description",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //amount controller
                        TextFormField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Amount",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20)),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

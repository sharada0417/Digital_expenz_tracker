import 'package:flutter/material.dart';

class BugetScreen extends StatefulWidget {
  const BugetScreen({super.key});

  @override
  State<BugetScreen> createState() => _BugetScreenState();
}

class _BugetScreenState extends State<BugetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Budget Screen"),
      ),
    );
  }
}

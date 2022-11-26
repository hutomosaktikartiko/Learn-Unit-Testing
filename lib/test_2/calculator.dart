import 'package:flutter/material.dart';

import 'view/calculator_page.dart';

void mainTest2() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalculatorPage(),
    );
  }
}
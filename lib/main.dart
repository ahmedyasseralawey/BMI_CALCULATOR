import 'package:bmi_calculator/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorIMCApp());
}

class CalculatorIMCApp extends StatelessWidget {
  const CalculatorIMCApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

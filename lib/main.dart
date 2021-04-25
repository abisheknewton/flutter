import 'package:bmi_calculator/bmi_extension.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Calculator",
      home: InputPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff000000),
      ),
    );
  }
}

const containers_color = 0xff1d1e33;

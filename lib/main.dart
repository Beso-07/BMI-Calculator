import 'package:firstapp/BMI-Calculator/bmi_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FristApp());
}

class FristApp extends StatelessWidget {
  const FristApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: BmiScreen());
  }
}

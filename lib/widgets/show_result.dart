import 'package:flutter/material.dart';

class ResultSection extends StatelessWidget {
  final double bmi;
  final String resultText;

  const ResultSection({super.key, required this.bmi, required this.resultText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '  YOUR BMI: ',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              bmi.toStringAsFixed(1),
              style: const TextStyle(
                fontSize: 25,
                color: Color(0xffEA5E60),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              resultText,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
  
}

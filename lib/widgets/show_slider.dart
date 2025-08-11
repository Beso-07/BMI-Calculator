import 'package:flutter/material.dart';

class HeightSlider extends StatelessWidget {
  final double height;
  final ValueChanged<double> onChanged;

  const HeightSlider({
    super.key,
    required this.height,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${height.toInt()} cm',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xffF3A49F),
          ),
        ),
        Slider(
          year2023: false,
          activeColor: Colors.white,
          inactiveColor: const Color(0xffF3A49F),
          min: 0,
          max: 220,
          divisions: 220,
          value: height,
          onChanged: onChanged,
        ),
      ],
    );
  }
}


class WeightSlider extends StatelessWidget {
  final double weight;
  final ValueChanged<double> onChanged;

  const WeightSlider({
    super.key,
    required this.weight,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${weight.toInt()} kg',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xffF3A49F),
          ),
        ),
        Slider(
          year2023: false,
          activeColor: Colors.white,
          inactiveColor: const Color(0xffF3A49F),
          min: 0,
          max: 220,
          divisions: 220,
          value: weight,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

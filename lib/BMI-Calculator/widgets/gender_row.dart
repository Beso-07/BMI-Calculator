import 'package:flutter/material.dart';

enum GenderType { MALE, FEMALE }

class GenderRow extends StatefulWidget {
  GenderRow({super.key});

  @override
  State<GenderRow> createState() => _GenderRowState();
}

class _GenderRowState extends State<GenderRow> {
  GenderType? selectedGender;

  void selectGender(GenderType gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  Color changeBackgroundColor(GenderType gender) {
    return selectedGender == gender
        ? const Color(0xffffffff)
        : const Color(0xffF3A49F);
  }

  Color changeTextIconColor(GenderType gender) {
    return selectedGender == gender
        ? const Color(0xffEA5E60)
        : const Color(0xffFFEEE0);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => selectGender(GenderType.MALE),
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: changeBackgroundColor(GenderType.MALE),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.male,
                      size: 30,
                      color: changeTextIconColor(GenderType.MALE),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Male',
                      style: TextStyle(
                        fontSize: 20,
                        color: changeTextIconColor(GenderType.MALE),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 30),
          Expanded(
            child: GestureDetector(
              onTap: () => selectGender(GenderType.FEMALE),
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: changeBackgroundColor(GenderType.FEMALE),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.female,
                      size: 30,
                      color: changeTextIconColor(GenderType.FEMALE),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Female',
                      style: TextStyle(
                        fontSize: 20,
                        color: changeTextIconColor(GenderType.FEMALE),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:firstapp/widgets/gender_row.dart';
import 'package:firstapp/widgets/show_result.dart';
import 'package:firstapp/widgets/show_slider.dart';
import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xffEA5E60);

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  double height = 110;
  double weight = 110;
  double bmi = 0;
  IconData icon = Icons.arrow_right_alt;
  GenderType selectedGender = GenderType.MALE;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'BMI CLACULATOR',
          style: TextStyle(fontSize: 26, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                height = 110;
                weight = 110;
                bmi = 0;
                icon = Icons.arrow_right_alt;
                selectedGender = GenderType.MALE;
              });
            },
            icon: Icon(Icons.refresh, color: Colors.white, size: 30),
          ),
        ],
      ),
      backgroundColor: kPrimaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kPrimaryColor, Colors.white],
            stops: [0.65, 1.0],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  'GENDER',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              SizedBox(height: 20),
              GenderRow(
                selectedGender: selectedGender,
                onGenderChanged: (gender) {
                  setState(() {
                    selectedGender = gender;
                  });
                },
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  'HEIGHT',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              SizedBox(height: 20),
              HeightSlider(
                height: height,
                onChanged: (value) => setState(() => height = value),
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  'WEIGHT',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              SizedBox(height: 20),
              WeightSlider(
                weight: weight,
                onChanged: (value) => setState(() => weight = value),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '  Calculate BMI',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 95,
                    width: 95,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      shape: CircleBorder(),
                      onPressed: () {
                        setState(() {
                          bmi = weight / (height / 100 * height / 100);
                          icon = Icons.refresh;
                        });
                      },
                      child: Icon(icon, color: kPrimaryColor, size: 50),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              if (bmi != 0) ResultSection(bmi: bmi, resultText: showResult()),
            ],
          ),
        ),
      ),
    );
  }

  String showResult() {
    if (bmi < 18.5) {
      return "You are underweight. Eat more!";
    } else if (bmi < 25) {
      return "You have a normal body weight. Great job!";
    } else if (bmi < 30) {
      return "You are overweight. Exercise more!";
    } else {
      return "You are obese. Be careful!";
    }
  }
}

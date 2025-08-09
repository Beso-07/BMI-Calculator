import 'package:firstapp/BMI-Calculator/widgets/gender_row.dart';
import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xffEA5E60);

class BmiScreen extends StatefulWidget {
  BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  double height = 110;
  double weight = 110;
  double bmi = 0;
  IconData icon = Icons.arrow_right_alt;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kPrimaryColor, Colors.white],
            stops: [0.6, 1.0],
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
              GenderRow(),
              SizedBox(height: 30),
              Center(
                child: Text(
                  'HEIGHT',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              SizedBox(height: 20),
              Column(
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
                    activeColor: Colors.white,
                    inactiveColor: Color(0xffF3A49F),
                    min: 0,
                    max: 220,
                    divisions: 220,
                    value: height,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  'WEIGHT',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              SizedBox(height: 20),
              Column(
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
                    activeColor: Colors.white,
                    inactiveColor: Color(0xffF3A49F),
                    min: 0,
                    max: 220,
                    divisions: 220,
                    value: weight,
                    onChanged: (value) {
                      setState(() {
                        weight = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '  Calculate BMI',
                    style: TextStyle(fontSize: 30, color: Colors.white),
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
                      child: Icon(icon, color: kPrimaryColor, size: 35),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              if (bmi != 0) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('  YOUR BMI: ', style: TextStyle(fontSize: 25)),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 25,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      showResult(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ],
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

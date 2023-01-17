import 'dart:io';
import 'package:bmicalculator/ReusableCard.dart';
import 'package:bmicalculator/RoundIconButton.dart';
import 'package:flutter/material.dart';
import 'BMICalculatorInput.dart';
import 'BMIConstants.dart';
import 'smallRoundButton.dart';

double bmiValue = bmi;
String bmiResult = '';
String bmiMessage = '';
Color bmiResultColor = Color(0xFFD61C4E);

class BMICalculatorResult extends StatelessWidget {
  const BMICalculatorResult({super.key});

  @override
  Widget build(BuildContext context) {
    if (bmi >= 25) {
      bmiResult = 'OVERWEIGHT';
      bmiMessage =
          'You have a higher than normal body weight. Try to EXERCISE more!';
      bmiResultColor = Color(0xFFD61C4E);
    } else if (bmi > 18.5) {
      bmiResult = 'NORMAL';
      bmiMessage = 'Your body weight is normal. Keep it up. GOOD JOB!';
      bmiResultColor = Color(0xFF7FB77E);
    } else {
      bmiResult = 'UNDERWEIGHT';
      bmiMessage =
          'You have a lower than normal body weight. You can EAT a bit more!';
      bmiResultColor = Color(0xFFFF9356);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
            style: TextStyle(
              color: Color(0xFF1E2547),
              fontSize: 20.0,
              fontFamily: 'SourceSansPro',
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
            ),
          ),
          centerTitle: true,
          actions: [
            SmallRoundIconButton(
                icon: Icons.close_rounded,
                onPressed: () {
                  exit(0);
                },
                iconColor: activeCardBorderColor)
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: ReusableCard(
              cardBorderColor: inactiveCardBorderColor,
              onPress: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    bmiResult,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      color: bmiResultColor,
                    ),
                  ),
                  Text(
                    bmiValue.toString(),
                    style: const TextStyle(
                      fontSize: 100.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Text(
                    bmiMessage,
                    style: labelStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )),
            Container(
              margin: EdgeInsets.fromLTRB(0, 5.0, 0, 10.0),
              child: RoundIconButton(
                icon: Icons.refresh_rounded,
                iconColor: Color(0xFFD61C4E),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            ),
          ],
        ));
  }
}
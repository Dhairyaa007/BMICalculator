import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'ReusableCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/ReusableIcon.dart';
import 'BMIConstants.dart';
import 'RoundIconButton.dart';
import 'smallRoundButton.dart';

enum Gender { male, female }

Gender? selectedGender;
int height = 180;
int weight = 60;
int age = 18;
double bmi = 0;

double calculateBMI(height, weight) {
  bmi = (weight / pow(height / 100, 2));
  bmi = double.parse((bmi).toStringAsFixed(2));
  return bmi;
}

class BMICalculator extends StatefulWidget {
  BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  @override
  Widget build(BuildContext context) {
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
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: (() {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    }),
                    cardBorderColor: selectedGender == Gender.male
                        ? activeCardBorderColor
                        : inactiveCardBorderColor,
                    cardChild: ReusableIcon(
                      cardIcon: FontAwesomeIcons.mars,
                      Label: 'MALE',
                      iconColor: Color(0xFFFF9356),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardBorderColor: selectedGender == Gender.female
                        ? activeCardBorderColor
                        : inactiveCardBorderColor,
                    cardChild: ReusableIcon(
                        cardIcon: FontAwesomeIcons.venus,
                        Label: 'FEMALE',
                        iconColor: Color(0xFFff4181)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {},
              cardBorderColor: inactiveCardBorderColor,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'HEIGHT',
                            style: labelStyle,
                          )
                        ]),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: numberStyle,
                        ),
                        Text(
                          'cm',
                          style: labelStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(trackHeight: 1.0),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          activeColor: Color(0xFFD61C4E),
                          inactiveColor: Color(0xFFFFEEEEEE),
                          onChanged: (double newHeight) {
                            setState(() {
                              height = newHeight.toInt();
                            });
                          }),
                    )
                  ]),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  onPress: () {},
                  cardBorderColor: inactiveCardBorderColor,
                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: labelStyle,
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: numberStyle,
                            ),
                            Text(
                              'kg',
                              style: labelStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              iconColor: Color(0xFFFF9356),
                              icon: Icons.horizontal_rule,
                              onPressed: (() {
                                setState(() {
                                  if (weight > 0) {
                                    weight -= 1;
                                  }
                                });
                              }),
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              iconColor: Color(0xFFFF9356),
                              icon: Icons.add,
                              onPressed: (() {
                                setState(() {
                                  if (weight < 250) {
                                    weight += 1;
                                  }
                                });
                              }),
                            )
                          ],
                        )
                      ]),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    cardBorderColor: inactiveCardBorderColor,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: labelStyle,
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            age.toString(),
                            style: numberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                iconColor: Color(0xFFFF9356),
                                icon: Icons.horizontal_rule,
                                onPressed: (() {
                                  setState(() {
                                    if (age > 0) {
                                      age -= 1;
                                    }
                                  });
                                }),
                              ),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                iconColor: Color(0xFFFF9356),
                                icon: Icons.add,
                                onPressed: (() {
                                  setState(() {
                                    if (age < 150) {
                                      age += 1;
                                    }
                                  });
                                }),
                              )
                            ],
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 5.0, 0, 10.0),
            child: RoundIconButton(
              icon: Icons.play_arrow_rounded,
              iconColor: Color(0xFFD61C4E),
              onPressed: () {
                Navigator.pushNamed(context, '/BMIResult');
                setState(() {
                  calculateBMI(height, weight);
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
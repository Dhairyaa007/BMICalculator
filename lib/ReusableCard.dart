import 'package:flutter/material.dart';
import 'dart:ui';
// typedef VoidCallback = void Function();

class ReusableCard extends StatelessWidget {
  final Widget cardChild;
  final Color cardBorderColor;
  final VoidCallback onPress;

  ReusableCard(
      {super.key,
      required this.cardChild,
      required this.cardBorderColor,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: cardBorderColor,
            width: 3,
          ),
        ),
        margin: EdgeInsets.all(15),
        height: 200,
        width: 170,
      ),
    );
  }
}
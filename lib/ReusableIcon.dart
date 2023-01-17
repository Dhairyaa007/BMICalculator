import 'package:flutter/material.dart';
import 'BMIConstants.dart';

class ReusableIcon extends StatelessWidget {
  final IconData cardIcon;
  final String Label;
  final Color iconColor;
  ReusableIcon(
      {required this.cardIcon, required this.Label, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 70.0,
          color: iconColor,
        ),
        SizedBox(height: 10.0),
        Text(Label, style: labelStyle)
      ],
    );
  }
}
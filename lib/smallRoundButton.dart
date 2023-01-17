import 'package:flutter/material.dart';

class SmallRoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color iconColor;
  SmallRoundIconButton(
      {required this.icon, required this.onPressed, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      onPressed: onPressed,
      constraints: const BoxConstraints.tightFor(height: 25.0, width: 25.0),
      shape: const CircleBorder(),
      fillColor: iconColor,
      child: Icon(icon, color: Colors.white),
    );
  }
}
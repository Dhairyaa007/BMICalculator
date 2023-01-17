import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color iconColor;
  RoundIconButton(
      {required this.icon, required this.onPressed, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      onPressed: onPressed,
      constraints: const BoxConstraints.tightFor(height: 40.0, width: 40.0),
      shape: const CircleBorder(),
      fillColor: iconColor,
      child: Icon(icon, color: Colors.white),
    );
  }
}
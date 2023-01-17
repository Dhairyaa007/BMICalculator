import 'package:flutter/material.dart';

class SmallReusableIcon extends StatelessWidget {
  final IconData cardIcon;
  final Color iconColor;
  SmallReusableIcon({required this.cardIcon, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 20.0,
          color: iconColor,
        ),
      ],
    );
  }
}
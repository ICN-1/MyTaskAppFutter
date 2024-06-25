import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key, required this.icon, required this.onPressed, required this.backgroundColor, required this.iconColor, required this.heroTag});

  final Color backgroundColor, iconColor;
  final IconData icon;
  final VoidCallback onPressed;
  final Object heroTag; 

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      shape: CircleBorder(),
      child: Icon(
        icon,
        color: iconColor,
      )
    );
  }
}
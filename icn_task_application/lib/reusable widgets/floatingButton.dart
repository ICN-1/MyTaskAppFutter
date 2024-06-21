import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key, required this.icon, required this.onPressed, required this.backgroundColor, required this.iconColor});

  final Color backgroundColor, iconColor;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final Color titleColor;
  final String title;
  final VoidCallback onPressed;
  final double radius;
  final double width;
  final double height;
  final IconData? icon;

  const CustomButton({super.key,
    required this.backgroundColor,
    required this.titleColor,
    this.title = "",
    required this.onPressed,
    this.radius = 20.0,
    this.icon,
    this.width = 120,
    this.height = 80, // Default radius value
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: icon != null
            ? Icon(
          icon,
          color: titleColor,
          size: 24.0,
          semanticLabel: title,
        )
            : Text(
          title,
          style: TextStyle(
            color: titleColor,
          ),
        ),
      ),
    );
  }
}

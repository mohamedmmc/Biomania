import 'package:flutter/material.dart';

class CustomButtonIcon extends StatelessWidget {
  final Color backgroundColor;
  final Color titleColor;
  final String title;
  final VoidCallback onPressed;
  final double radius;
  final double width;
  final double height;
  final bool isSelected;

  const CustomButtonIcon({super.key,
    required this.backgroundColor,
    required this.titleColor,
    this.title = "",
    required this.onPressed,
    this.radius = 20.0,
    this.width = 120,
    this.height = 80,
    this.isSelected = false,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(width: 8.0), // Adjust the spacing between icon and text
                Text(
                  title,
                  style: TextStyle(
                    color: titleColor,
                  ),
                ),
              ],
            ),
            if (isSelected)
              Container(
                width: 30.0,
                height: 30.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

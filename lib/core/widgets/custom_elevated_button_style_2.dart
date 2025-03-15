import 'package:absher_app/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButtonStyle2 extends StatelessWidget {
  const CustomElevatedButtonStyle2({
    super.key,
    this.onPressed,
    required this.title,
    this.color = AppColors.lightBrownColor,
  });
  final Function()? onPressed;
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          )),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomRo2yaElevatedButton extends StatelessWidget {
  const CustomRo2yaElevatedButton(
      {super.key, this.onPressed, required this.title, this.color});
  final Function()? onPressed;
  final String title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        backgroundColor: color ?? AppColors.brownColor,
        textStyle: AppTextStyles.title16LightBrown,
        foregroundColor:
            color == null ? AppColors.lightBrownColor : AppColors.brownColor,
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}

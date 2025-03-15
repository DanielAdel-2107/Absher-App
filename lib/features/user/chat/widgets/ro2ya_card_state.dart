import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Ro2yaCardState extends StatelessWidget {
  const Ro2yaCardState({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.brownColor, width: 5),
          color: AppColors.lightBrownColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(child: Text(message, style: AppTextStyles.title28Brown)),
      ),
    );
  }
}

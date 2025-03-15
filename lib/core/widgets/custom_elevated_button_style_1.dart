import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButtonStyle1 extends StatelessWidget {
  const CustomElevatedButtonStyle1({
    super.key,
    this.onPressed,
    required this.title,
  });
  final Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightBrownColor,
          foregroundColor: AppColors.brownColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          )),
      onPressed: onPressed,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0.h),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.title28Brown
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGendarCard extends StatelessWidget {
  const CustomGendarCard({
    super.key,
    required this.title,
    this.onTap,
    required this.isSelected,
  });
  final String title;
  final Function()? onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: isSelected ? AppColors.brownColor : AppColors.lightBrownColor,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0.h),
            child: Center(
              child: Text(
                title,
                style: AppTextStyles.title18White,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

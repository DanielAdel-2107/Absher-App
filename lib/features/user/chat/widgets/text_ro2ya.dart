import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextRo2ya extends StatelessWidget {
  const TextRo2ya({super.key, required this.ro2ya});
  final String ro2ya;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.brownColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.1,
              vertical: 8.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("الرؤيا",style: AppTextStyles.title20White,),
              Text(
                ro2ya,
                style: AppTextStyles.title20LightBrown,
              
              ),
            ],
          ),
        ),);
  }
}
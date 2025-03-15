import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFieldWithTitle extends StatelessWidget {
  const CustomTextFieldWithTitle({
    super.key,
    required this.title,
    required this.hintTitle,
    required this.controller,
  });
  final String title;
  final String hintTitle;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5.h,
      children: [
        Text(
          title,
          style: AppTextStyles.title18Brown,
        ),
        TextFormField(
          controller: controller,
          validator: (value) => value!.isEmpty ? "ادخل القيمه" : null,
          decoration: InputDecoration(
            hintText: hintTitle,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.brownColor),
              borderRadius: BorderRadius.circular(16.r),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.brownColor),
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
        ),
      ],
    );
  }
}

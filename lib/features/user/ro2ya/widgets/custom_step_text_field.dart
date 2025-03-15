import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomStepsTextField extends StatelessWidget {
  const CustomStepsTextField({
    super.key,
    required this.hintText,
    required this.label,
    this.maxLines = 1,
    this.controller,
    this.validator,
    this.enableValidation = false,
    this.maxLength,
    this.enable = true,
    this.onTap,
    this.keyboardType,
  });
  final String hintText;
  final String label;
  final int maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool enableValidation;
  final int? maxLength;
  final bool enable;
  final Function()? onTap;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.title18Brown,
        ),
        TextFormField(
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: enableValidation
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  }
                  return null;
                }
              : null,
          controller: controller,
          enabled: enable,
          onTap: onTap,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(
                color: AppColors.brownColor,
                width: 1.0,
              ),
            ),
          ),
          maxLines: maxLines,
          maxLength: maxLength,
        ),
      ],
    );
  }
}

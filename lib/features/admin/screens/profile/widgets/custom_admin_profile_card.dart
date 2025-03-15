import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAdminProfileCard extends StatelessWidget {
  const CustomAdminProfileCard({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightBrownColor,
      child: ListTile(
        title: Text(
          title,
          style: AppTextStyles.title20Brown,
        ),
        subtitle: Text(
          value,
          style: AppTextStyles.title16Brown,
        ),
      ),
    );
  }
}

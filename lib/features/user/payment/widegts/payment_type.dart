import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class PaymentType extends StatelessWidget {
  const PaymentType({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.title20Brown,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.lightBrownColor,
            border: Border.all(color: AppColors.brownColor),
          ),
          child: Center(
              child: Text(
            subTitle,
            style: AppTextStyles.title18Brown,
          )),
        )
      ],
    );
  }
}

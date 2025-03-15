import 'dart:ui';

import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class SendRo2yaTitle extends StatelessWidget {
  const SendRo2yaTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: AppColors.brownColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "ارسل رؤياك الان",
              textAlign: TextAlign.right,
              style: AppTextStyles.title24White,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class Ro2yaFormUsers extends StatelessWidget {
  const Ro2yaFormUsers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "من رؤيا وبشرى",
          style: AppTextStyles.title20Brown,
        ),
      ],
    );
  }
}

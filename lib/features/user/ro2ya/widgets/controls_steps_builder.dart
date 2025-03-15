import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ControlsStepsBuilder extends StatelessWidget {
  const ControlsStepsBuilder({
    super.key,
    this.details,
  });
  final dynamic details;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.brownColor,
            ),
            onPressed: details.onStepContinue,
            child: Text(
              "التالي",
              style: AppTextStyles.title16White,
            ),
          ),
        ),
        details.onStepCancel != null
            ? Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: AppColors.brownColor, width: 20),
                    ),
                  ),
                  onPressed: details.onStepCancel,
                  child: Text(
                    "السابق",
                    style: AppTextStyles.title16Brown,
                  ),
                ),
              )
            : SizedBox()
      ],
    );
  }
}

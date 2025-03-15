import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class PaymentScreenTitle extends StatelessWidget {
  const PaymentScreenTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "بيانات الدفع للرؤيا",
          style: AppTextStyles.title28Brown,
        ),
      ],
    );
  }
}

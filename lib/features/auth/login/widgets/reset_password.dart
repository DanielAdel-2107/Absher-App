import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/core/widgets/show_button_sheet.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bottomSheet(context);
      },
      child: Text(
        'نسيت كلمة المرور ؟',
        style: AppTextStyles.title18grey,
      ),
    );
  }
}

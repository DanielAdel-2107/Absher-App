import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/features/auth/create_interpreter_account/widgets/create_interpreter_account_screen_body.dart';
import 'package:flutter/material.dart';

class CreateInterpreterAccountScreen extends StatelessWidget {
  const CreateInterpreterAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.brownColor,
          title: Text(
            "انشاء حساب مفسر",
            style: AppTextStyles.title20White,
          ),
          foregroundColor: Colors.white,
        ),
        body: CreateInterpreterAccountScreenBody());
  }
}

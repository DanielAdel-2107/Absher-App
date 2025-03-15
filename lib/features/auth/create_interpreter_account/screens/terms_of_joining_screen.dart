import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/features/auth/create_interpreter_account/widgets/terms_of_joining_screen_body.dart';
import 'package:flutter/material.dart';

class TermsOfJoiningScreen extends StatelessWidget {
  const TermsOfJoiningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'شروط الانضمام كمفسر',
        ),
        backgroundColor: AppColors.brownColor,
      ),
      body: TermsOfJoiningScreenBody(),
    );
  }
}

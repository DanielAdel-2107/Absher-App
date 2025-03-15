import 'package:absher_app/core/colors/app_colors.dart';

import 'package:absher_app/features/auth/register/widgets/register_screen_body.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brownColor,
      body: RegisterScreenBody(),
    );
  }
}

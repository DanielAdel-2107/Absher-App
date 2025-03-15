import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/features/auth/login/widgets/login_screen_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppColors.brownColor,
          body: LoginScreenBody(),
        ));
  }
}

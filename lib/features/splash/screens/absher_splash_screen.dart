import 'package:absher_app/core/colors/app_colors.dart';

import 'package:absher_app/features/splash/widgets/absher_splash_screen_bodt.dart';
import 'package:flutter/material.dart';

class AbsherSplashScreen extends StatelessWidget {
  const AbsherSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brownColor,
      body: AbsherSplashScreenBody(),
    );
  }
}

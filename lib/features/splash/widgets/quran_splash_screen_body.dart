import 'package:absher_app/core/assets/images/app_images.dart';
import 'package:flutter/material.dart';

class QuranSplashScreenBody extends StatelessWidget {
  const QuranSplashScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppImages.quranImage,
      ),
    );
  }
}

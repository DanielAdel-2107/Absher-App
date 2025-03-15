import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/features/user/about_us/widgets/about_screen_body.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'من نحن؟',
          style: AppTextStyles.title24White,
        ),
        backgroundColor: AppColors.brownColor,
      ),
      body: AboutScreenBody(),
    );
  }
}

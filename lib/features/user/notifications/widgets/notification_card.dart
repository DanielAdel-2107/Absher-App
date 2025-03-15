import 'package:absher_app/core/assets/images/app_images.dart';
import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightBrownColor,
      child: ListTile(
        leading: CircleAvatar(
            backgroundImage: AssetImage(AppImages.absherSplashImage)),
        title: Text(
          title,
          style: AppTextStyles.title24KBrownColor,
        ),
        subtitle: Text(
          subTitle,
          style: AppTextStyles.title18Brownsmall,
        ),
      ),
    );
  }
}

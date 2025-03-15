import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/routing/app_routes.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class AddRo2yaButton extends StatelessWidget {
  const AddRo2yaButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.close,
      backgroundColor: AppColors.brownColor,
      foregroundColor: Colors.white,
      activeBackgroundColor: AppColors.brownColor,
      activeForegroundColor: Colors.white,
      children: [
        SpeedDialChild(
          labelBackgroundColor: AppColors.brownColor,
          foregroundColor: Colors.white,
          label: 'الرؤيا لي',
          labelStyle: AppTextStyles.title18White,
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.stepScreen,
                arguments: 'الرؤيا لي');
          },
        ),
        SpeedDialChild(
          labelBackgroundColor: AppColors.brownColor,
          foregroundColor: Colors.white,
          labelStyle: AppTextStyles.title18White,
          label: 'الرؤيا لشخص اخر',
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.stepScreen,
                arguments: 'الرؤيا لشخص اخر');
          },
        ),
      ],
    );
  }
}

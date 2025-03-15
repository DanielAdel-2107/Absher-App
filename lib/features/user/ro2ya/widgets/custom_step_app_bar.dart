import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomStepAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomStepAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
      backgroundColor: AppColors.brownColor,
      title: Text(
        'رؤيا جديدة',
        style: AppTextStyles.title20White,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // TODO();
}

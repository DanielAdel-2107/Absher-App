  import 'package:absher_app/app/my_app.dart';
import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showCustomDialog(String title, String message,Function()? onPressed) {
  showDialog(
    context: navigatorKey.currentState!.context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.lightBrownColor,
        title: Text(title,style: AppTextStyles.title28Brown,),
        content: Text(message,style: AppTextStyles.title18Black,),
        actions: [
          TextButton(
          style: TextButton.styleFrom(backgroundColor: AppColors.brownColor),
          onPressed: onPressed,
          child: Text("موافق",style: AppTextStyles.title18LightBrown,),
                    ),
          TextButton(
            style: TextButton.styleFrom(backgroundColor: AppColors.brownColor),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("غير موافق",style: AppTextStyles.title18LightBrown,),
          ),
        ],
      );
    },
  );
}

import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/widgets/custom_elevated_button_style_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserOptions extends StatelessWidget {
  const UserOptions({
    super.key,
    this.onPressed,
  });
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: CustomElevatedButtonStyle2(
        title: "ارجاع الرؤيا",
        color: AppColors.brownColor,
        onPressed: onPressed,
      ),
    );
  }
}

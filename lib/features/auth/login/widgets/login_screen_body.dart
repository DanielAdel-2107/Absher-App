import 'package:absher_app/core/assets/images/app_images.dart';
import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/features/auth/login/widgets/interpreter_tab.dart';
import 'package:absher_app/features/auth/login/widgets/interpreter_tab_view.dart';
import 'package:absher_app/features/auth/login/widgets/user_tab.dart';
import 'package:absher_app/features/auth/login/widgets/user_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.absherSplashImage,
          height: 200,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: AppColors.lightBrownColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: AppColors.brownColor,
            indicator: BoxDecoration(
              color: AppColors.brownColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            unselectedLabelStyle: AppTextStyles.title18Brown,
            labelStyle: AppTextStyles.title18LightBrown,
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            labelPadding: EdgeInsets.symmetric(vertical: 8),
            tabs: [
              UserTab(),
              InterpreterTap(),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            children: [
              UserTabView(),
              InterpreterTabView(),
            ],
          ),
        )
      ],
    );
  }
}

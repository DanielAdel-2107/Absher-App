import 'package:absher_app/core/assets/images/app_images.dart';
import 'package:absher_app/core/routing/app_routes.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/core/widgets/custom_elevated_button_style_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AbsherSplashScreenBody extends StatelessWidget {
  const AbsherSplashScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            AppImages.absherSplashImage,
            width: 300.w,
          ),
          Text(
            'رؤيا و بشرى دليلك اليومي للروح والقلب',
            style: AppTextStyles.title28White,
            textAlign: TextAlign.center,
          ),
          CustomElevatedButtonStyle1(
            title: 'اضغط للبدايه',
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.loginScreen);
            },
          )
        ],
      ),
    );
  }
}

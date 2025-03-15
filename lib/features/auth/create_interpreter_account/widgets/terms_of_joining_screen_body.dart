import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/routing/app_routes.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/core/widgets/custom_elevated_button_style_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsOfJoiningScreenBody extends StatelessWidget {
  const TermsOfJoiningScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'شروط الانضمام كمفسر:',
              style: AppTextStyles.title24KBrownColor,
            ),
            SizedBox(height: 8.h),
            _buildCondition('- الالتزام بالسنة'),
            _buildCondition('- سرعة الرد'),
            _buildCondition('- عدم الاختصار غير المخل في الرد'),
            _buildCondition('- التعامل الجيد مع انطباع المستفيدين'),
            _buildCondition(
                '- إرسال التقييم الشهري لكل مفسر على حدة كلما احتجنا إلى ذلك'),
            _buildCondition(
                '- لا نحرص أبدًا على إظهار اسم المفسر ورقمه لأننا حريصون على أن يكون التفسير فيه بعد عن الظهور والرياء وتعليق الرائي بالأشخاص المفسرين'),
            _buildCondition(
                '- المفسر يهتم بما يتعلق بالتفسير ونفع المستفيد فقط'),
            _buildCondition('- يجب أن يكون المفسر عالمًا صالحًا'),
            SizedBox(height: 16.h),
            Text(
              '📌 استنادًا إلى قول النبي ﷺ:',
              style: AppTextStyles.title20LightBrown,
            ),
            SizedBox(height: 8.h),
            Text(
              '"لا تقصّ الرؤيا إلا على عالم أو ناصح" (رواه الترمذي وصححه الألباني).',
              style: AppTextStyles.title18Brown,
            ),
            SizedBox(height: 16.h),
            CustomElevatedButtonStyle2(
              title: "انضم الان",
              color: AppColors.brownColor,
              onPressed: () {
                Navigator.pushNamed(
                    context, AppRoutes.createInterpreterAccountScreen);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCondition(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0.w),
      child: Text(
        text,
        style: AppTextStyles.title18Brown,
      ),
    );
  }
}

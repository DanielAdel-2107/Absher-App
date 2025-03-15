import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/widgets/custom_elevated_button_style_2.dart';
import 'package:absher_app/core/widgets/custom_outline_button.dart';
import 'package:absher_app/features/user/chat/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InterpreterOptions extends StatelessWidget {
  const InterpreterOptions({
    super.key,
    required this.provider,
  });
  final ChatProvider provider;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomOutlineButton(
          title: provider.welcomeMessage,
          onPressed: () {
            provider.selectText(text: provider.welcomeMessage);
          },
        ),
        CustomOutlineButton(
          title: provider.endMessage,
          onPressed: () {
            provider.selectText(text: provider.endMessage);
          },
        ),
        SizedBox(height: 10.h),
        CustomElevatedButtonStyle2(
          title: "تم التقسير",
          onPressed: () {
            provider.explanationRo2ya(context: context);
          },
        ),
        SizedBox(height: 10.h),
        CustomElevatedButtonStyle2(
          title: "ارجاع الرؤيا",
          color: AppColors.brownColor,
          onPressed: () {
            provider.returnRo2ya(context: context);
          },
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}

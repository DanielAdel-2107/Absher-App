import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/features/auth/create_interpreter_account/widgets/custom_gender_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectGender extends StatelessWidget {
  const SelectGender({
    super.key,
    this.onTapMale,
    this.onTapFemale,
    required this.isSelectedMale,
    required this.isSelectedFemale,
  });
  final Function()? onTapMale;
  final Function()? onTapFemale;
  final bool isSelectedMale;
  final bool isSelectedFemale;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("اختار الجنس", style: AppTextStyles.title18Brown),
        Row(
          spacing: 10.w,
          children: [
            CustomGendarCard(
              title: "ذكر",
              onTap: onTapMale,
              isSelected: isSelectedMale,
            ),
            CustomGendarCard(
              title: "انثى",
              onTap: onTapFemale,
              isSelected: isSelectedFemale,
            ),
          ],
        ),
      ],
    );
  }
}

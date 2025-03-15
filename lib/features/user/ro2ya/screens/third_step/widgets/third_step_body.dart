import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/core/widgets/custom_elevated_button_style_2.dart';
import 'package:absher_app/features/user/ro2ya/provider/steps_provider.dart';
import 'package:flutter/material.dart';

class ThirdStepBody extends StatelessWidget {
  const ThirdStepBody({
    super.key,
    required this.provider,
    required this.aboutRo2ya,
  });
  final StepsProvider provider;
  final String aboutRo2ya;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "عنوان الرؤيا",
        style: AppTextStyles.title20Brown,
      ),
      Text(
          provider.ro2yaNameController.text == ""
              ? "لم يتم ادخال عنوان الرؤيا"
              : provider.ro2yaNameController.text,
          style: AppTextStyles.title18Brownsmall),
      Text(
        "الرؤيا",
        style: AppTextStyles.title20Brown,
      ),
      Text(
          provider.filePath != null
              ? "رؤيا صوتيه"
              : provider.ro2yaController.text.isEmpty
                  ? "لم يتم ادخال الرؤيا"
                  : provider.ro2yaController.text,
          style: AppTextStyles.title18Brownsmall),
      SizedBox(
        height: 20,
      ),
      provider.dataLoaded
          ? Center(
              child: CircularProgressIndicator(),
            )
          : CustomElevatedButtonStyle2(
              title: "ارسال الرؤيا",
              onPressed: () {
                provider.selectAboutRo2ya(aboutRo2ya);

                provider.sendRo2ya(
                  context,
                );
              },
            ),
      SizedBox(
        height: 50,
      )
    ]);
  }
}

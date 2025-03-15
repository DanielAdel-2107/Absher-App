import 'package:absher_app/core/assets/images/app_images.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/features/user/ro2ya/screens/frist_step/widget/custom_ro2ya_type.dart';
import 'package:absher_app/features/user/ro2ya/provider/steps_provider.dart';
import 'package:flutter/widgets.dart';

class FristStepBody extends StatelessWidget {
  const FristStepBody({
    super.key,
    required this.provider,
  });
  final StepsProvider provider;
  @override
  Widget build(BuildContext context) {
    return Column(spacing: 20, children: [
      Text(
        'اختر الباقه المناسبه',
        style: AppTextStyles.title20Black,
      ),
      CustomRo2yaType(
        onTap: () {
          provider.selectRo2yaType(1);
        },
        currentIndex: 1,
        index: provider.index ?? 0,
        image: AppImages.greyGrown,
        price: Text(
          "21 .رس\nاو\n6 دولار",
          style: AppTextStyles.title20Black,
          textAlign: TextAlign.center,
        ),
        subTitle:
            "تتيح لك كتابة رؤيا واحدة حتي 1000 حرف",
        title: 'الفضيه',
      ),
      CustomRo2yaType(
        onTap: () {
          provider.selectRo2yaType(2);
        },
        currentIndex: 2,
        index: provider.index ?? 0,
        image: AppImages.amberGrown,
        price: Text(
          "26 رس\nاو\n7 دولار",
          style: AppTextStyles.title20amber,
          textAlign: TextAlign.center,
        ),
        subTitle:
            "تتيح لك التسجيل الصوتي لمدة 3 دقائق - رؤيتان معا في تسجيل واحد. ( ويمكنك كتابة الرؤيتين بحد اقصى 1500 حرف )",
        title: 'الذهبيه',
      ),
      SizedBox(
        height: 30,
      )
    ]);
  }
}

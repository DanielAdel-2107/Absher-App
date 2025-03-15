import 'package:absher_app/core/assets/images/app_images.dart';
import 'package:absher_app/features/user/home/widgets/custom_category.dart';
import 'package:flutter/material.dart';

class CustomCategoryGridView extends StatelessWidget {
  const CustomCategoryGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 4,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: [
        CustomCategory(image: AppImages.fatawy, title: "فتاوي الرؤي"),
        CustomCategory(image: AppImages.azkarImage, title: "الاذكار والادعيه"),
        CustomCategory(image: AppImages.prayingImage, title: "مواقيت الصلاه"),
        CustomCategory(image: AppImages.moshafImage, title: "القران الكريم"),
        CustomCategory(image: AppImages.qublaImage, title: "القبله"),
        CustomCategory(image: AppImages.roro2ya, title: "الرؤيه الشرعيه"),
        CustomCategory(image: AppImages.articles, title: "مقالات وفوائد"),
        CustomCategory(image: AppImages.storiesImage, title: "قصص"),
      ],
    );
  }
}

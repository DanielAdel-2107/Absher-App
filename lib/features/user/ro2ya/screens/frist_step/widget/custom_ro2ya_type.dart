import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomRo2yaType extends StatelessWidget {
  const CustomRo2yaType({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.image,
    required this.index,
    required this.currentIndex,
    this.onTap,
  });
  final String title;
  final String subTitle;
  final Text price;
  final String image;
  final int index;
  final int currentIndex;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: currentIndex == index ? AppColors.brownColor : Colors.white,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: AppTextStyles.title20Black,
            ),
            Row(
              children: [
                Image.asset(
                  image,
                  height: 30,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      subTitle,
                      style: AppTextStyles.title16Red,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Column(
                  children: [price, Text("شامل الضريبه")],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

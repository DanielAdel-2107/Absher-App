import 'package:absher_app/core/assets/images/app_images.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class HijriDate extends StatelessWidget {
  const HijriDate({
    super.key,
    required this.formattedDate,
  });

  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
          color: Colors.orange.shade100,
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(
            fit: BoxFit.fill,
            opacity: 0.2,
            image: AssetImage(AppImages.mosqueImage),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('الصلاة القادمة', style: AppTextStyles.title20Brown),
                Icon(Icons.replay_outlined),
              ],
            ),
          ),
          Text(formattedDate, style: AppTextStyles.title18Brown),
        ],
      ),
    );
  }
}

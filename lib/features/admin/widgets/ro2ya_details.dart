import 'dart:developer';

import 'package:absher_app/core/routing/app_routes.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/core/widgets/custom_ro2ya_elevated_button.dart';
import 'package:absher_app/features/models/explanation_model.dart';
import 'package:absher_app/features/user/chat/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Ro2yaDetails extends StatelessWidget {
  const Ro2yaDetails({
    super.key,
    required this.explanationModel,
  });

  final ExplanationModel explanationModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'اسم العميل',
          style: AppTextStyles.title20Brown,
        ),
        Text(
          "xxxx xxxxx",
          style: AppTextStyles.title18Brownsmall,
        ),
        const SizedBox(height: 8.0),
        Text(
          'ايميل العميل',
          style: AppTextStyles.title20Brown,
        ),
        Text(
          "xxxx@gmail.com",
          style: AppTextStyles.title18Brownsmall,
        ),
        const SizedBox(height: 8.0),
        Text(
          'الرؤيا',
          style: AppTextStyles.title20Brown,
        ),
        Text(
          explanationModel.ro2ya,
          style: AppTextStyles.title18Brownsmall,
        ),
        const SizedBox(height: 8.0),
        explanationModel.payed == false
            ? Text(
                "في انتظار الدفع من العميل لبدء الشات",
                style: AppTextStyles.title18Brown,
              )
            : explanationModel.close == true
                ? Text(
                    "تم اغلاق الشات من الشيخ",
                    style: AppTextStyles.title18Brown,
                  )
                : explanationModel.delete_chat
                    ? Text(
                        "تم حذف المحادثه",
                        style: AppTextStyles.title18Brown,
                      )
                    : explanationModel.returned_ro2ya
                        ? Text(
                            "تم ارجاع الرؤيا الي الشيخ",
                            style: AppTextStyles.title18Brown,
                          )
                        : Consumer<ChatProvider>(
                            builder: (context, provider, child) {
                            return CustomRo2yaElevatedButton(
                              title: "التحدث مع العميل",
                              onPressed: () async {
                                log(explanationModel.id.toString());
                                await provider.chatStream(
                                    chatKey: explanationModel.id,
                                    userId: explanationModel.userId);
                                Navigator.pushReplacementNamed(
                                    context, AppRoutes.chatScreen);
                              },
                            );
                          }),
        explanationModel.doneExplanation
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'تعليق العميل',
                    style: AppTextStyles.title20Brown,
                  ),
                  CustomUserFeedBack(explanationModel: explanationModel)
                ],
              )
            : SizedBox()
      ],
    );
  }
}

class CustomUserFeedBack extends StatelessWidget {
  const CustomUserFeedBack({
    super.key,
    required this.explanationModel,
  });

  final ExplanationModel explanationModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            generateStars(explanationModel.rating),
            style: AppTextStyles.title20Brown,
          ),
          Text("التقييم ", style: AppTextStyles.title20LightBrown),
          Text(
            explanationModel.userFeedback ?? "",
            style: AppTextStyles.title18Brown,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

String generateStars(String? rating) {
  if (rating == null || rating.trim().isEmpty) {
    log("Rating is null or empty. Returning empty string.");
    return "";
  }
  rating = rating.replaceAll(RegExp(r'[^\d.]'), '').trim();
  double? rate = double.tryParse(rating);
  if (rate == null || rate <= 0) {
    log("Invalid rating value: '$rating'. Returning empty string.");
    return "";
  }
  log("Parsed rating: $rate");
  int fullStars = rate.floor(); // عدد النجوم الكاملة
  bool hasHalfStar = (rate - fullStars) >= 0.5; // هل يوجد نصف نجمة؟
  String stars = "⭐" * fullStars + (hasHalfStar ? "⭐️½" : "");
  log("Generated stars: $stars");
  return stars;
}

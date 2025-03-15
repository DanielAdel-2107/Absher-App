import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/features/models/opinions_model.dart';
import 'package:flutter/material.dart';

class CustomUserOpinions extends StatelessWidget {
  const CustomUserOpinions({
    super.key,
    required this.opinionsModel,
  });
  final OpinionsModel opinionsModel;
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
            generateStars(opinionsModel.rating ?? ""),
            style: AppTextStyles.title20Brown,
          ),
          Text("التقييم ", style: AppTextStyles.title20LightBrown),
          Text(
            opinionsModel.opinion ?? "",
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
    return "";
  }
  rating = rating.replaceAll(RegExp(r'[^\d.]'), '').trim();
  double? rate = double.tryParse(rating);
  if (rate == null || rate <= 0) {
    return "";
  }
  int fullStars = rate.floor();
  bool hasHalfStar = (rate - fullStars) >= 0.5;
  String stars = "⭐" * fullStars + (hasHalfStar ? "⭐️½" : "");
  return stars;
}

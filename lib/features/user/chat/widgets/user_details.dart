import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/features/models/explanation_model.dart';
import 'package:absher_app/features/user/chat/widgets/chat_screen_user_details.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
    required this.explanationModel,
  });
  final ExplanationModel explanationModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
          color: AppColors.lightBrownColor,
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            direction: Axis.horizontal,
            children: [
              ChatScreenUserDetails(
                title: "عمر المستفيد",
                value: explanationModel.age!,
              ),
              ChatScreenUserDetails(
                title: "الجنس",
                value: explanationModel.gender!,
              ),
              ChatScreenUserDetails(
                title: "المهنه",
                value: explanationModel.employment_status!,
              ),
              ChatScreenUserDetails(
                title: "الحاله الاجتماعيه",
                value: explanationModel.maritalStatus!,
              ),
            ],
          ),
          ChatScreenUserDetails(
            title: "وقت الرؤيا",
            value: explanationModel.ro2ya_time!,
          ),
          ChatScreenUserDetails(
            title: "معلومات اضافيه",
            value: explanationModel.more_data ?? "لم يتم اضافة معلومات اضافيه",
          ),
        ],
      ),
    );
  }
}

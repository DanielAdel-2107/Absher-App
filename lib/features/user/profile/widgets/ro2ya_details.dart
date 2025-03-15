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
    required this.icon,
    this.onPressed,
  });
  final ExplanationModel explanationModel;
  final IconData icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "اسم المفسر",
          style: AppTextStyles.title20Brown,
        ),
        Text(
          explanationModel.interpreterName == null
              ? "لم يتم تحويل الرؤيا للمفسر"
              : "xxxx xxxx",
          style: AppTextStyles.title18Brownsmall,
        ),
        Text(
          "ايميل المفسر",
          style: AppTextStyles.title20Brown,
        ),
        Text(
          explanationModel.interpreterEmail == null
              ? "لم يتم تحويل الرؤيا للمفسر"
              : "xxxxx@gmail.com",
          style: AppTextStyles.title18Brownsmall,
        ),
        Text(
          "الرؤيا",
          style: AppTextStyles.title20Brown,
        ),
        Text(
          explanationModel.ro2ya,
          style: AppTextStyles.title18Brownsmall,
        ),
        explanationModel.ro2yaUrl != null
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(icon),
              )
            : SizedBox(),
        Text(
          "التفسير",
          style: AppTextStyles.title20Brown,
        ),
        Text(
          explanationModel.returned_ro2ya
              ? "سيتم تحويل الرؤيا الي مفسر اخر"
              : explanationModel.doneExplanation == false
                  ? "لم يتم التفسير"
                  : "تم التفسير",
          style: AppTextStyles.title18Brownsmall,
        ),
        explanationModel.doneExplanation == true ||
                explanationModel.interpreterId == null
            ? SizedBox()
            : explanationModel.close == true
                ? Text("تم اغلاق الشات من الشيخ")
                : explanationModel.delete_chat
                    ? Text("تم حذف المحادثه")
                    : explanationModel.payed
                        ? Consumer<ChatProvider>(
                            builder: (context, provider, child) {
                              return CustomRo2yaElevatedButton(
                                title: "التحدث مع المفسر",
                                onPressed: () async {
                                  log(explanationModel.id.toString());
                                  await provider.chatStream(
                                      chatKey: explanationModel.id,
                                      userId: explanationModel.userId);
                                  Navigator.pushReplacementNamed(
                                      context, AppRoutes.chatScreen);
                                },
                              );
                            },
                          )
                        : CustomRo2yaElevatedButton(
                            title: "رؤية بيانات الدفع",
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.paymentScreen);
                            },
                          )
      ],
    );
  }
}

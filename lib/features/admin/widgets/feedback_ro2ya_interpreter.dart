import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/dependancy_injection/dependancy_injection.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/core/widgets/custom_elevated_button_style_2.dart';
import 'package:absher_app/core/widgets/custom_text_field.dart';
import 'package:absher_app/features/admin/screens/home/provider/feedback_provider.dart';
import 'package:absher_app/features/models/explanation_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Ro2yaFeedback extends StatelessWidget {
  const Ro2yaFeedback({
    super.key,
    required this.explanationModel,
  });

  final ExplanationModel explanationModel;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => locator<FeedbackProviderForAdmin>(),
        child: Consumer<FeedbackProviderForAdmin>(
          builder: (context, provider, child) {
            return Form(
                key: provider.formKey,
                child: Column(
                  children: [
                    Text(
                      "اذا كنت تريد اضافة تعليق للعميل ( اختياري )",
                      style: AppTextStyles.title20Brown,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightBrownColor,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      padding: const EdgeInsets.all(4.0),
                      child: CustomTextField(
                        title: "اكتب التعليق هنا",
                        controller: provider.feedbackController,
                        enabled: explanationModel.chat,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    CustomElevatedButtonStyle2(
                      title: "ارسال التعليق",
                      color: AppColors.brownColor,
                      onPressed: () {
                        provider.updateFeedback(
                            explanationId: explanationModel.id,
                            context: context);
                      },
                    ),
                  ],
                ));
          },
        ));
  }
}

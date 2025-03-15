import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/dependancy_injection/dependancy_injection.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/core/widgets/custom_elevated_button_style_2.dart';
import 'package:absher_app/core/widgets/custom_text_field.dart';
import 'package:absher_app/features/user/profile/provider/feedback_provider.dart';
import 'package:absher_app/features/models/explanation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Ro2yaFeedback extends StatelessWidget {
  const Ro2yaFeedback({
    super.key,
    required this.explanationModel,
  });
  final ExplanationModel explanationModel;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => locator<FeedbackProviderForUser>(),
      child: Consumer<FeedbackProviderForUser>(
        builder: (context, provider, child) {
          return Form(
              key: provider.formKey,
              child: Column(
                children: [
                  Text(
                    "اذا كنت تريد اضافة تعليق للمفسر ( اختياري )",
                    style: AppTextStyles.title20Brown,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0.w),
                    decoration: BoxDecoration(
                      color: AppColors.lightBrownColor,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 4.h),
                    child: RatingBar.builder(
                      ignoreGestures: explanationModel.doneExplanation == true
                          ? false
                          : true,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star_rate_rounded,
                        color: AppColors.brownColor,
                      ),
                      initialRating: 0,
                      unratedColor: Colors.grey.shade200,
                      onRatingUpdate: (rating) {
                        provider.setRating(rating);
                      },
                    ),
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
                      enabled: explanationModel.doneExplanation == false
                          ? false
                          : true,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  provider.uploadFeedback
                      ? Center(child: CircularProgressIndicator())
                      : CustomElevatedButtonStyle2(
                          title: " ارسال التعليق للمفسر",
                          color: AppColors.brownColor,
                          onPressed: () {
                            provider.updateFeedback(
                                context: context,
                                explanationId: explanationModel.id);
                          },
                        ),
                ],
              ));
        },
      ),
    );
  }
}

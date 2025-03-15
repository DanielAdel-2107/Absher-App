import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/dependancy_injection/dependancy_injection.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/core/widgets/custom_elevated_button_style_2.dart';
import 'package:absher_app/core/widgets/custom_text_field.dart';
import 'package:absher_app/features/admin/screens/home/provider/explanation_ro2ya_provider.dart';
import 'package:absher_app/features/models/explanation_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExplanationRo2ya extends StatelessWidget {
  const ExplanationRo2ya({
    super.key,
    required this.interpreter,
  });

  final ExplanationModel interpreter;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => locator<ExplanationRo2yaProvider>(),
        child: Consumer<ExplanationRo2yaProvider>(
          builder: (context, provider, child) {
            return Form(
              key: provider.formKey,
              child: Column(
                children: [
                  Text(
                    "تفسير الرؤيا",
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
                        title: "اكتب التفسير هنا",
                        controller: provider.explanationController,
                        enabled: interpreter.chat,
                      )),
                  SizedBox(height: 20.0),
                  CustomElevatedButtonStyle2(
                    title: "ارسال التفسير للمستخدم",
                    color: AppColors.brownColor,
                    onPressed: () async {
                      await provider.updateExplanation(
                        interpreterId: interpreter.id,
                        context: context,
                        userId: interpreter.userId,
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ));
  }
}

import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/core/widgets/custom_elevated_button_style_2.dart';
import 'package:absher_app/features/auth/login/widgets/custom_user_details_text_field.dart';
import 'package:absher_app/features/auth/provider/reset_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

PersistentBottomSheetController bottomSheet(BuildContext context) {
  return showBottomSheet(
      context: context,
      elevation: 0.4,
      showDragHandle: true,
      enableDrag: true,
      backgroundColor: AppColors.lightBrownColor,
      builder: (context) => Container(
            height: MediaQuery.sizeOf(context).height / 2,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.brownColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: ChangeNotifierProvider(
                create: (context) => ResetPasswordProvider(),
                child: Consumer<ResetPasswordProvider>(
                    builder: (context, provider, child) {
                  return Form(
                    key: provider.formKey,
                    child: Column(spacing: 20, children: [
                      Text(
                        "برجاء ادخال الايميل الذي يتم استعادة كلمة المرور عليه",
                        style: AppTextStyles.title24White,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: CustomUserDetailsTextField(
                          title: 'البريد الالكتروني',
                          icon: Icons.email,
                          controller: provider.emailController,
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomElevatedButtonStyle2(
                        title: "استعاده",
                        onPressed: () {
                          provider.resetPassword(context: context);
                        },
                      )
                    ]),
                  );
                })),
          ));
}

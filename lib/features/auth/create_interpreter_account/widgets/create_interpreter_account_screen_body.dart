import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/dependancy_injection/dependancy_injection.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/core/widgets/custom_drop_down_button_field.dart';
import 'package:absher_app/core/widgets/custom_elevated_button_style_2.dart';
import 'package:absher_app/core/widgets/custom_text_field_with_title.dart';
import 'package:absher_app/features/auth/create_interpreter_account/provider/create_interpreter_account_provider.dart';
import 'package:absher_app/features/auth/create_interpreter_account/widgets/select_gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CreateInterpreterAccountScreenBody extends StatelessWidget {
  const CreateInterpreterAccountScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => locator<CreateInterpreterAccountProvider>(),
        child: Consumer<CreateInterpreterAccountProvider>(
          builder: (context, provider, child) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SingleChildScrollView(
                child: Form(
                  key: provider.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15.h,
                    children: [
                      CustomTextFieldWithTitle(
                        controller: provider.nameController,
                        hintTitle: "ادخل الاسم",
                        title: "الاسم",
                      ),
                      CustomTextFieldWithTitle(
                        controller: provider.emailController,
                        hintTitle: "ادخل البريد الالكترونى",
                        title: "البريد الالكترونى",
                      ),
                      CustomTextFieldWithTitle(
                        controller: provider.ageController,
                        hintTitle: "ادخل عمرك",
                        title: "عمرك",
                      ),
                      CustomTextFieldWithTitle(
                        controller: provider.phoneController,
                        hintTitle: "ادخل رقم الجوال",
                        title: "رقم الجوال",
                      ),
                      SelectGender(
                        isSelectedFemale: provider.gender == "انثى",
                        isSelectedMale: provider.gender == "ذكر",
                        onTapMale: () {
                          provider.selectGender(gender: "ذكر");
                        },
                        onTapFemale: () {
                          provider.selectGender(gender: "انثى");
                        },
                      ),
                      Text("اختر الدوله", style: AppTextStyles.title18Brown),
                      CustomDropDownButtonFormField(
                        dataList: provider.saudiCities,
                        title: "اختر الدوله",
                        onChanged: (value) {
                          provider.selectCity(city: value!.toString());
                        },
                      ),
                      CustomTextFieldWithTitle(
                        controller: provider.passwordController,
                        hintTitle: "ادخل الرقم السرى",
                        title: "الرقم السرى",
                      ),
                      provider.isLoading
                          ? Center(child: CircularProgressIndicator())
                          : CustomElevatedButtonStyle2(
                              title: "ارسال الطلب",
                              onPressed: () {
                                provider.addRequest(context: context);
                              },
                              color: AppColors.brownColor,
                            ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:absher_app/core/assets/images/app_images.dart';
import 'package:absher_app/core/dependancy_injection/dependancy_injection.dart';
import 'package:absher_app/core/routing/app_routes.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/core/widgets/custom_elevated_button_style_2.dart';
import 'package:absher_app/core/widgets/custom_text_button.dart';
import 'package:absher_app/features/auth/provider/sign_up_provider.dart';
import 'package:absher_app/features/auth/register/widgets/custom_register_screen_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => locator<SignUpProvider>(),
      child: Consumer<SignUpProvider>(builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Form(
              key: provider.formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.absherSplashImage,
                      height: 200.h,
                    ),
                    Text('حساب جديد', style: AppTextStyles.title24White),
                    SizedBox(
                      height: 20,
                    ),
                    CustomRegisterScreenTextField(
                      title: "الاسم",
                      controller: provider.namecontroller,
                    ),
                    CustomRegisterScreenTextField(
                      title: "رقم الهاتف",
                      controller: provider.phonecontroller,
                    ),
                    CustomRegisterScreenTextField(
                      title: "البريد الالكتروني",
                      controller: provider.emailController,
                    ),
                    CustomRegisterScreenTextField(
                      title: "اسم المستخدم",
                      controller: provider.userNameController,
                    ),
                    CustomRegisterScreenTextField(
                      title: "كلمة المرور",
                      isSecure: true,
                      controller: provider.passwordController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    provider.isProgress
                        ? CircularProgressIndicator()
                        : CustomElevatedButtonStyle2(
                            title: 'انشاء حساب',
                            onPressed: () {
                              provider.signUpWithSupabase(context);
                            },
                          ),
                    CustomTextButton(
                        title: 'تسجيل الدخول',
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.loginScreen);
                        })
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

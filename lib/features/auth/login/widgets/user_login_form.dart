import 'package:absher_app/core/dependancy_injection/dependancy_injection.dart';
import 'package:absher_app/core/widgets/custom_elevated_button_style_2.dart';
import 'package:absher_app/features/auth/login/widgets/custom_user_details_text_field.dart';
import 'package:absher_app/features/auth/provider/sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserLoginForm extends StatelessWidget {
  const UserLoginForm({
    super.key,
    required this.type,
  });
  final String type;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => locator<SignInProvider>(),
        child: Consumer<SignInProvider>(builder: (context, provider, child) {
          return Form(
            key: provider.formKey,
            child: Column(
              spacing: 10,
              children: [
                Column(
                  children: [
                    CustomUserDetailsTextField(
                      title: 'البريد الالكتروني',
                      icon: Icons.person,
                      controller: provider.namecontroller,
                    ),
                    CustomUserDetailsTextField(
                      title: 'كلمة المرور',
                      icon: Icons.lock,
                      controller: provider.passwordController,
                      isSecure: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    provider.isProgress
                        ? CircularProgressIndicator()
                        : CustomElevatedButtonStyle2(
                            title: 'تسجيل الدخول',
                            onPressed: () {
                              provider.signInWithSupabase(
                                  context: context, type: type);
                            },
                          ),
                  ],
                ),
              ],
            ),
          );
        }));
  }
}

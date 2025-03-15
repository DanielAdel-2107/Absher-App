import 'package:absher_app/core/assets/images/app_images.dart';
import 'package:absher_app/features/auth/provider/sign_in_with_google_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginWithSocialAuth extends StatelessWidget {
  const LoginWithSocialAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignInWithGoogleProvider(),
      child: Consumer<SignInWithGoogleProvider>(
        builder: (context, provider, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 30,
            children: [
              GestureDetector(
                onTap: () {
                  provider.signInWIthGoogle(context: context);
                },
                child: Image.asset(
                  AppImages.googleImage,
                  height: 50,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:absher_app/features/auth/login/widgets/login_with_social_auth.dart';
import 'package:absher_app/features/auth/login/widgets/reset_password.dart';
import 'package:absher_app/features/auth/login/widgets/user_dont_have_an_account.dart';
import 'package:absher_app/features/auth/login/widgets/user_login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserTabView extends StatelessWidget {
  const UserTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                UserLoginForm(
                  type: 'users',
                ),
                SizedBox(
                  height: 15.h,
                ),
                LoginWithSocialAuth(),
                ResetPassword(),
                UserDontHaveAnAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

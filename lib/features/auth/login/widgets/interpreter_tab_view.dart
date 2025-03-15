import 'package:absher_app/features/auth/login/widgets/create_account_to_interpreter.dart';
import 'package:absher_app/features/auth/login/widgets/user_login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InterpreterTabView extends StatelessWidget {
  const InterpreterTabView({
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
                  type: "interpreter",
                ),
                SizedBox(
                  height: 15.h,
                ),
                CreateAccountForInterpreter()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:absher_app/core/routing/app_routes.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:flutter/widgets.dart';

class UserDontHaveAnAccount extends StatelessWidget {
  const UserDontHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          " لا يوجد لديك حساب؟",
          style: AppTextStyles.title18Green,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.registerScreen);
          },
          child: Text(
            " انشاء حساب جديد",
            style: AppTextStyles.title18Green,
          ),
        ),
      ],
    );
  }
}

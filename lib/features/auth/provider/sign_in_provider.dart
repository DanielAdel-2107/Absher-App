import 'package:absher_app/core/routing/app_routes.dart';
import 'package:absher_app/core/services/supabase/auth/sign_in_with_password.dart';
import 'package:flutter/material.dart';

class SignInProvider with ChangeNotifier {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String selectedOption = 'مستخدم';
  String homeScreen = AppRoutes.homeScreen;
  bool isProgress = false;
  set selectOption(String value) {
    selectedOption = value;
    if (selectedOption == 'مستخدم') {
      homeScreen = AppRoutes.homeScreen;
    } else {
      homeScreen = AppRoutes.homeScreenForAdmin;
    }
    notifyListeners();
  }

  signInWithSupabase(
      {required BuildContext context, required String type}) async {
    if (formKey.currentState!.validate()) {
      isProgress = true;
      notifyListeners();
      await signIn(
        email: namecontroller.text,
        password: passwordController.text,
        type: type,
        context: context,
      );
      isProgress = false;
      notifyListeners();
    }
  }
}

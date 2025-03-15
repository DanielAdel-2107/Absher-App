import 'package:absher_app/core/services/supabase/auth/sign_up_with_password.dart';
import 'package:flutter/material.dart';

class SignUpProvider with ChangeNotifier {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isProgress = false;

  signUpWithSupabase(context) async {
    if (formKey.currentState!.validate()) {
      isProgress = true;
      notifyListeners();
      await signUp(
          email: emailController.text,
          password: passwordController.text,
          name: namecontroller.text,
          phone: phonecontroller.text,
          context: context);
      isProgress = false;
      notifyListeners();
    }
  }
}

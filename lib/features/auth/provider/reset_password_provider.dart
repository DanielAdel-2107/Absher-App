// ignore_for_file: use_build_context_synchronously

import 'package:absher_app/core/functions/show_error_dialog.dart';
import 'package:absher_app/core/functions/show_success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ResetPasswordProvider with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> resetPassword({required BuildContext context}) async {
    if (formKey.currentState!.validate()) {
      try {
        await Supabase.instance.client.auth
            .resetPasswordForEmail(emailController.text);
        Navigator.pop(context);
        showSuccessDialog(context,
            "برجاء التحقق من بريدك الإلكتروني للحصول على رابط استعادة كلمة المرور.");
      } catch (e) {
        showErrorDialog(context, e.toString());
      }
    }
  }
}

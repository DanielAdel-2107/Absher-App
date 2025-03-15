// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:absher_app/core/functions/show_error_dialog.dart';
import 'package:absher_app/core/functions/show_success_dialog.dart';
import 'package:absher_app/core/routing/app_routes.dart';
import 'package:absher_app/core/services/supabase/database/add_user_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';

Future<void> signUp(
    {required BuildContext context,
    required String email,
    required String name,
    required String phone,
    required String password,
    String? role}) async {
  final supabase = Supabase.instance.client;

  try {
    final response = await supabase.auth.signUp(
      email: email,
      password: password,
    );
    await addUserData(name: name, email: email, phone: phone, role: role);
    if (response.user != null) {
      role == "interpreter"
          ? {
              showSuccessDialog(context, "تم التسجيل بنجاح!"),
            }
          : {
              Navigator.pushNamed(context, AppRoutes.loginScreen),
              showSuccessDialog(context, "تم التسجيل بنجاح!"),
            };
    } else {
      showErrorDialog(context, "حدث خطأ. حاول مرة أخرى.");
    }
  } on AuthException catch (e) {
    if (e.message.contains("already registered")) {
      showErrorDialog(
        context,
        "هذا البريد الإلكتروني مسجل بالفعل. يرجى تسجيل الدخول.",
      );
    } else if (e.message.contains("password strength")) {
      showErrorDialog(
        context,
        "كلمة المرور ضعيفة جدًا. يجب أن تحتوي على 6 أحرف على الأقل، وتشمل أرقامًا وحروفًا كبيرة وصغيرة.",
      );
    } else {
      showErrorDialog(context, e.message.toString());
    }
    log(e.message.toString());
  } catch (e) {
    log(e.toString());
    showErrorDialog(context, "حدث خطأ غير متوقع. حاول مرة أخرى.");
  }
}

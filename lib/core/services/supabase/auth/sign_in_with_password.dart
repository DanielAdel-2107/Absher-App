// ignore_for_file: use_build_context_synchronously

import 'package:absher_app/core/notifications/show_notification.dart';
import 'package:absher_app/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:absher_app/core/functions/show_error_dialog.dart';
import 'package:absher_app/core/functions/show_success_dialog.dart';

Future<void> signIn(
    {required BuildContext context,
    required String email,
    required String password,
    required String type}) async {
  final supabase = Supabase.instance.client;

  try {
    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    final data = await supabase
        .from("users")
        .select()
        .eq('id', supabase.auth.currentUser!.id)
        .eq("role", type == "users" ? "user" : "interpreter");
    bool getData = false;
    for (var element in data) {
      getData = element['email'] == email;
    }
    if (response.user != null) {
      if (getData) {
        handleUnreadNotificationsStream(
            userId: Supabase.instance.client.auth.currentUser!.id);
        Navigator.pushNamedAndRemoveUntil(
            context,
            type == 'users'
                ? AppRoutes.homeScreen
                : AppRoutes.homeScreenForAdmin,
            (_) => false);
      } else {
        if (type == 'users') {
          showErrorDialog(context, "انت لست مستخدم");
          return;
        } else {
          showErrorDialog(context, "انت لست مفسر");
          return;
        }
      }
      showSuccessDialog(context, "تم التسجيل بنجاح!");
    } else {
      showErrorDialog(context, "حدث خطأ. حاول مرة أخرى.");
    }
  } on AuthException catch (e) {
    showErrorDialog(context, e.message.toString());
  }
}

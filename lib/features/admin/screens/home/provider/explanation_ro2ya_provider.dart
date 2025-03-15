import 'dart:developer';

import 'package:absher_app/core/notifications/add_notification.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ExplanationRo2yaProvider with ChangeNotifier {
  final TextEditingController explanationController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  updateExplanation(
      {required String interpreterId,
      required String userId,
      required BuildContext context}) async {
    if (formKey.currentState!.validate()) {
      try {
        log(userId.toString());
        log(interpreterId.toString());
        await Supabase.instance.client
            .from('explanation')
            .update({'explanation_ro2ya': explanationController.text}).eq(
          'id',
          interpreterId,
        );
        await addNotification(userId, "تفسير الرؤيا",
            "تم تفسير الرؤيا بنجاح اطلع عليها لمعرفة التفسير");
        explanationController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم نشر التفسير بنجاح'),
          ),
        );
        Navigator.pop(context);
      } on Exception catch (e) {
        log(e.toString());
      }
    }
  }
}

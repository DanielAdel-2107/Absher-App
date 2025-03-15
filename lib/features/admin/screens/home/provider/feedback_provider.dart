import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FeedbackProviderForAdmin with ChangeNotifier {
  final TextEditingController feedbackController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  updateFeedback(
      {required String explanationId, required BuildContext context}) async {
    if (formKey.currentState!.validate()) {
      try {
        await Supabase.instance.client
            .from('explanation')
            .update({'interpreter_feedbak': feedbackController.text}).eq(
          'id',
          explanationId,
        );
        feedbackController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم اضافة التعليق بنجاح'),
          ),
        );
        Navigator.pop(context);
      } on Exception catch (e) {
        log(e.toString());
      }
    }
  }
}

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FeedbackProviderForUser with ChangeNotifier {
  final TextEditingController feedbackController = TextEditingController();
  int? rating;
  final formKey = GlobalKey<FormState>();
  setRating(double value) {
    rating = value.toInt();
    notifyListeners();
  }

  bool uploadFeedback = false;
  updateFeedback(
      {required String explanationId, required BuildContext context}) async {
    if (formKey.currentState!.validate() && rating != null) {
      try {
        uploadFeedback = true;
        notifyListeners();
        Map<String, dynamic> data = {
          "id": explanationId,
        };
        if (feedbackController.text.isNotEmpty) {
          data["user_feedback"] = feedbackController.text;
        }
        if (rating != null) {
          data["rating"] = rating;
        }
        await Supabase.instance.client.from('explanation').upsert(data);
        feedbackController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم اضافة التعليق بنجاح'),
          ),
        );
        uploadFeedback = false;
        notifyListeners();
        Navigator.pop(context);
      } on Exception catch (e) {
        log("Error updating feedback: ${e.toString()}");
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ادخل التعليق والتقييم'),
        ),
      );
    }
  }
}

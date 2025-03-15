// ignore_for_file: use_build_context_synchronously

import 'package:absher_app/core/functions/show_error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignOutProvider with ChangeNotifier {
  bool isprocess = false;
  logout({required BuildContext context}) async {
    isprocess = true;
    notifyListeners();
    try {
      await Supabase.instance.client.auth.signOut();
    } on Exception catch (e) {
      showErrorDialog(context, e.toString());
    }
    isprocess = false;
    notifyListeners();
  }
}

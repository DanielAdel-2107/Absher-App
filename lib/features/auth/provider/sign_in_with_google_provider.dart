import 'package:absher_app/core/services/supabase/auth/sign_in_with_google.dart';
import 'package:flutter/material.dart';

class SignInWithGoogleProvider with ChangeNotifier {
  signInWIthGoogle({required BuildContext context}) async {
    await signInWithGoogleSupabase(context);
  }
}

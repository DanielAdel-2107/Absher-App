import 'package:absher_app/core/functions/show_success_dialog.dart';
import 'package:absher_app/core/notifications/show_notification.dart';
import 'package:absher_app/core/routing/app_routes.dart';
import 'package:absher_app/core/services/supabase/database/add_user_data.dart';
import 'package:absher_app/core/services/supabase/database/get_user_data.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<AuthResponse> signInWithGoogleSupabase(BuildContext context) async {
  const webClientId =
      '91106707799-k55vqkmd48qupjks8kh7t01gsd4oki44.apps.googleusercontent.com';

  final supabase = Supabase.instance.client;

  final GoogleSignIn googleSignIn = GoogleSignIn(
    serverClientId: webClientId,
  );
  final googleUser = await googleSignIn.signIn();
  final googleAuth = await googleUser!.authentication;
  final accessToken = googleAuth.accessToken;
  final idToken = googleAuth.idToken;

  if (accessToken == null) {
    throw 'No Access Token found.';
  }
  if (idToken == null) {
    throw 'No ID Token found.';
  }

  AuthResponse auth = await supabase.auth.signInWithIdToken(
    provider: OAuthProvider.google,
    idToken: idToken,
    accessToken: accessToken,
  );
  await addUserData(
    name: googleUser.displayName!,
    email: googleUser.email,
  );
  handleUnreadNotificationsStream(
      userId: Supabase.instance.client.auth.currentUser!.id);
  Navigator.pushNamedAndRemoveUntil(
      context, AppRoutes.homeScreen, (_) => false);
  showSuccessDialog(context, "تم التسجيل بنجاح!");
  await getUserData(tableName: "users");
  return auth;
}

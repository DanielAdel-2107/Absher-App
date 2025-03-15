import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> addUserData(
    {required String name,
    required String email,
    String? phone,
    String? role}) async {
  try {
    final supabase = Supabase.instance.client;
    await supabase.from('users').upsert({
      'id': supabase.auth.currentUser!.id,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role ?? 'user',
    });
  } catch (e) {
    log(e.toString());
  }
}

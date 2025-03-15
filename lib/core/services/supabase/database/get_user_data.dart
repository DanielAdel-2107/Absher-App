import 'dart:developer';

import 'package:absher_app/features/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<UserModel> getUserData({required String tableName}) async {
  try {
    final supabase = Supabase.instance.client;
    final data = await supabase
        .from(tableName)
        .select()
        .eq('id', supabase.auth.currentUser!.id);
    UserModel userModel = UserModel.fromJson(data[0]);
    return userModel;
  } on Exception catch (e) {
    log(e.toString());
    return UserModel(email: "", id: "", name: "", phone: "");
  }
}

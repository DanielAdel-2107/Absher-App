import 'dart:developer';

import 'package:absher_app/core/services/supabase/database/get_user_data.dart';
import 'package:absher_app/features/models/user_model.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  bool isdataLoaded = false;
  UserModel? userModel;
  UserProvider() {
    getData();
  }
  getData() async {
    try {
      userModel = await getUserData(tableName: 'users');
      log(userModel!.name);
      notifyListeners();
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}

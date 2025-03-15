import 'dart:developer';

import 'package:absher_app/core/services/supabase/database/get_user_data.dart';
import 'package:absher_app/features/models/user_model.dart';
import 'package:flutter/foundation.dart';

class InterpreterProvider with ChangeNotifier {
  bool isdataLoaded = false;
  UserModel? userModel;
  InterpreterProvider() {
    getData();
  }
  getData() async {
    try {
      userModel = await getUserData(tableName: "interpreter");
      log(userModel!.name);
      notifyListeners();
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}

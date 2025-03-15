// import 'dart:developer';

// import 'package:absher_app/features/models/interpreter_model.dart';
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class AdminProfileProvider with ChangeNotifier {
//   InterpreterModel? interpreterModel;
//   final supabase = Supabase.instance.client;
//   AdminProfileProvider() {
//     getAdminProfile();
//   }
//   getAdminProfile() async {
//     await supabase
//         .from('interpreter')
//         .select()
//         .eq("id", supabase.auth.currentUser!.id)
//         .then((value) =>
//             interpreterModel = InterpreterModel.fromJson(value.first));
//     notifyListeners();
//     log(interpreterModel.toString());
//   }
// }

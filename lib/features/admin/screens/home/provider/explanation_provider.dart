import 'dart:developer';

import 'package:absher_app/features/models/explanation_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ExplanationProvider with ChangeNotifier {
  List<ExplanationModel> interpreterModelList = [];
  String? errorMessage;
  bool dataLoaded = false;
  ExplanationProvider() {
    getUserState();
    _subscribeToExplanationUpdates();
  }
  final supabase = Supabase.instance.client;
  final userId = Supabase.instance.client.auth.currentUser!.id;
  final email = Supabase.instance.client.auth.currentUser!.email;
  void _subscribeToExplanationUpdates() {
    interpreterModelList.clear();
    supabase
        .from('explanation')
        .stream(primaryKey: ['id'])
        .eq('interpreter_email', email!)
        .listen((event) {
          interpreterModelList =
              event.map((data) => ExplanationModel.fromJson(data)).toList();
          dataLoaded = true;
          notifyListeners();
          log(interpreterModelList.length.toString());
        })
        .onError((error) {
          dataLoaded = false;
          notifyListeners();
          Future.delayed(Duration(seconds: 2), () {
            _subscribeToExplanationUpdates();
          });
          dataLoaded = true;
          notifyListeners();
        });
  }

  bool? newUser;
  getUserState() async {
    final data = await supabase
        .from("interpreter")
        .select()
        .eq("id", userId)
        .maybeSingle();
    try {
      if (data != null && data["status"] == true) {
        newUser = false;
      } else {
        newUser = true;
      }
      notifyListeners();
    } catch (e) {
      log("Error fetching user data: ${e.toString()}");
    }
  }
}

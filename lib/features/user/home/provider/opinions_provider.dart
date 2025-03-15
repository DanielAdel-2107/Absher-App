import 'dart:developer';
import 'package:absher_app/features/models/explanation_model.dart';
import 'package:absher_app/features/models/opinions_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OpinionsProvider with ChangeNotifier {
  List<OpinionsModel> opinionsModel = [];
  List<ExplanationModel> explanationModel = [];
  bool isdataLoaded = false;
  OpinionsProvider() {
    getOpinions();
  }
  getOpinions() async {
    final data = await Supabase.instance.client.from('explanation').select();
    opinionsModel.clear();
    explanationModel.clear();
    for (var element in data) {
      if (element["visiblity_feedback"] == true) {
        opinionsModel.add(OpinionsModel.fromJson(element));
      }
      log(opinionsModel.toString());
      if (element["visiblity"] == true) {
        explanationModel.add(ExplanationModel.fromJson(element));
      }
      log(explanationModel.toString());
    }
    isdataLoaded = true;
    notifyListeners();
    log(opinionsModel.toString());
  }
}

import 'dart:developer';

import 'package:absher_app/features/models/explanation_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DashboardProvider with ChangeNotifier {
  List<ExplanationModel> interpreterModelList = [];
  List<ExplanationModel> newRo2ya = [];
  List<ExplanationModel> inquiryRo2ya = [];
  List<ExplanationModel> waitExplanationRo2ya = [];
  List<ExplanationModel> explanationDoneRo2ya = [];
  String? errorMessage;
  bool dataLoaded = false;
  DashboardProvider() {
    loadData();
  }
  loadData() async {
    await getInterpreterState();
    await subscribeToExplanationUpdates();
  }

  Future<void> subscribeToExplanationUpdates() async {
    dataLoaded = false;
    notifyListeners();
    try {
      interpreterModelList.clear();
      newRo2ya.clear();
      inquiryRo2ya.clear();
      waitExplanationRo2ya.clear();
      explanationDoneRo2ya.clear();

      final data = await Supabase.instance.client
          .from('explanation')
          .select()
          .eq("interpreter_id", Supabase.instance.client.auth.currentUser!.id);
      data
          .map((data) =>
              interpreterModelList.add(ExplanationModel.fromJson(data)))
          .toList();
      for (var element in interpreterModelList) {
        if (element.interpreterName == "" || element.interpreterName == null) {
          newRo2ya.add(element);
        }
        if (element.doneExplanation == false) {
          waitExplanationRo2ya.add(element);
        }
        if (element.userFeedback == "" || element.userFeedback == null) {
          inquiryRo2ya.add(element);
        }
        if (element.doneExplanation == true &&
            element.interpreterName != null) {
          explanationDoneRo2ya.add(element);
        }
      }
    } on Exception catch (e) {
      Future.delayed(Duration(seconds: 2), () {
        subscribeToExplanationUpdates();
      });
    }
    dataLoaded = true;
    notifyListeners();
  }

  bool? available;
  bool? isStateUpdated = false;

  getInterpreterState() async {
    final data = await Supabase.instance.client
        .from('interpreter')
        .select()
        .eq("id", Supabase.instance.client.auth.currentUser!.id);
    available = data[0]['available'];
    log(available.toString());
    log(Supabase.instance.client.auth.currentUser!.id.toString());
    notifyListeners();
  }

  setState(bool value) {
    available = value;
    log(available.toString());
    notifyListeners();
  }

  updateState() async {
    if (available != null) {
      isStateUpdated = true;
      notifyListeners();

      await Supabase.instance.client.from('interpreter').update(
        {
          'available': available,
        },
      ).eq("id", Supabase.instance.client.auth.currentUser!.id);
      isStateUpdated = false;

      notifyListeners();
    }
  }
}

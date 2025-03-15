import 'dart:developer';
import 'package:absher_app/core/services/supabase/database/get_interpreter_data.dart';
import 'package:absher_app/core/services/supabase/database/get_user_data.dart';
import 'package:absher_app/features/models/user_model.dart';
import 'package:absher_app/features/models/explanation_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileProvider with ChangeNotifier {
  List<ExplanationModel>? interpreterModelList;
  bool dataloaded = false;
  final supabase = Supabase.instance.client;
  ProfileProvider() {
    getUser();
    fetchExplanationData();
  }
  fetchExplanationData() async {
    try {
      supabase
          .from('explanation')
          .stream(primaryKey: ["id"])
          .eq("user_id", supabase.auth.currentUser!.id)
          .listen((event) {
            interpreterModelList =
                event.map((data) => ExplanationModel.fromJson(data)).toList();
            dataloaded = true;
            explanationModel = null;
            notifyListeners();
          })
          .onError((error) {});
    } catch (e) {
      log(e.toString());
    }
    log("message");
    dataloaded = true;
    notifyListeners();
  }

  // user detaile
  UserModel? userModel;
  getUser() async {
    try {
      userModel = await getUserData(tableName: "users");
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  ////////
  ExplanationModel? explanationModel;
  Future<ExplanationModel?> reloadRo2ya({required String id}) async {
    final data = await getData(
      key: 'id',
      value: id,
    );
    explanationModel = data[0];
    notifyListeners();
    return explanationModel;
  }

  bool? visiblity;
  changeVisiblity(
      {required bool visiblityRo2ya,
      required String id,
      required BuildContext context}) async {
    await supabase
        .from('explanation')
        .update({'visiblity': visiblityRo2ya}).eq('id', id);
    visiblity = visiblityRo2ya;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(visiblity!
            ? "تم اظهار الرؤيا للاخرين"
            : "تم اخفاء الرؤيا عن للاخرين"),
      ),
    );
    visiblity = null;
    notifyListeners();
  }

  //
  bool isPlaying = false;
  final AudioPlayer _audioPlayer = AudioPlayer();
  Future<void> playRecording(String url) async {
    await _audioPlayer.play(UrlSource(url));
    isPlaying = true;
    notifyListeners();
    _audioPlayer.onPlayerComplete.listen((event) {
      stopPlayRecording();
    });
  }

  Future<void> stopPlayRecording() async {
    await _audioPlayer.stop();
    isPlaying = false;
    notifyListeners();
  }
}

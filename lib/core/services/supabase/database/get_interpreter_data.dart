import 'dart:developer';
import 'package:absher_app/features/models/explanation_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<List<ExplanationModel>> getData(
    {required String key, required String value}) async {
  final supabase = Supabase.instance.client;
  List<ExplanationModel> interpreterList = [];
  final data = await supabase.from('explanation').select().eq(key, value);
  data.forEach((element) {
    interpreterList.add(ExplanationModel.fromJson(element));
  });
  log(interpreterList.toString());
  return interpreterList;
}

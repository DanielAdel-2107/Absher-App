import 'package:absher_app/features/admin/screens/home/widgets/home_screen_body.dart';
import 'package:absher_app/features/models/explanation_model.dart';
import 'package:flutter/material.dart';

class CustomRo2yaListView extends StatelessWidget {
  const CustomRo2yaListView({
    super.key,
    required this.explanationList,
  });

  final List<ExplanationModel>? explanationList;

  @override
  Widget build(BuildContext context) {
    return HomeScreenBody(explanationList: explanationList);
  }
}

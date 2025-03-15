import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/features/user/profile/widgets/details_screen_body.dart';
import 'package:absher_app/features/models/explanation_model.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.explanationModel,
  });
  final ExplanationModel explanationModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightBrownColor,
        title: Text(explanationModel.ro2yaName),
      ),
      body: DetailsScreenbody(
        explanationModel: explanationModel,
      ),
    );
  }
}

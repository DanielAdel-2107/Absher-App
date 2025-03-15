import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/features/admin/screens/ro2ya/widgets/ro2ya_detail_screen_body.dart';
import 'package:absher_app/features/models/explanation_model.dart';
import 'package:flutter/material.dart';

class Ro2yaDetailsScreen extends StatelessWidget {
  final ExplanationModel explanationModel;

  const Ro2yaDetailsScreen({super.key, required this.explanationModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightBrownColor,
        title: Text(
          explanationModel.ro2ya,
        ),
      ),
      body: Ro2yaDetailsScreenBody(explanationModel: explanationModel),
    );
  }
}

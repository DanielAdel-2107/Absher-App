import 'package:absher_app/features/admin/widgets/ro2ya_details.dart';
import 'package:absher_app/features/models/explanation_model.dart';
import 'package:flutter/material.dart';

class Ro2yaDetailsScreenBody extends StatelessWidget {
  const Ro2yaDetailsScreenBody({
    super.key,
    required this.explanationModel,
  });

  final ExplanationModel explanationModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Ro2yaDetails(explanationModel: explanationModel),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Divider(
                thickness: 1.5,
              ),
            ),
            // ExplanationRo2ya(interpreter: explanationModel),
            // SizedBox(
            //   height: 10,
            // ),
            // Ro2yaFeedback(explanationModel: explanationModel)
          ],
        ),
      ),
    );
  }
}

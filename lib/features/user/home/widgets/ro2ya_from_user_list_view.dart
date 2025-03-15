import 'package:absher_app/features/models/explanation_model.dart';
import 'package:absher_app/features/user/home/widgets/custom_explain_ro2ya.dart';
import 'package:flutter/material.dart';

class Ro2yaFromUsersListView extends StatelessWidget {
  const Ro2yaFromUsersListView({
    super.key,
    required this.explanationModel,
  });
  final List<ExplanationModel> explanationModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CustomEplanationRp2ya(
          explanationModel: explanationModel[index],
        );
      },
      itemCount: explanationModel.length,
    );
  }
}

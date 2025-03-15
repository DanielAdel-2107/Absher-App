import 'package:absher_app/features/models/opinions_model.dart';
import 'package:absher_app/features/user/home/widgets/custom_user_options.dart';
import 'package:flutter/material.dart';

class UserFeedBackListView extends StatelessWidget {
  const UserFeedBackListView({
    super.key,
    required this.opinionsModel,
  });
  final List<OpinionsModel> opinionsModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ListView.builder(
        itemCount: opinionsModel.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomUserOpinions(
            opinionsModel: opinionsModel[index],
          );
        },
      ),
    );
  }
}

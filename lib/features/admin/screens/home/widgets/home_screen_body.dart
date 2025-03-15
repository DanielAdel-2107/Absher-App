import 'package:absher_app/core/assets/images/app_images.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/features/admin/screens/ro2ya/screens/ro2ya_details_screen.dart';
import 'package:absher_app/features/models/explanation_model.dart';
import 'package:flutter/material.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
    required this.explanationList,
  });

  final List<ExplanationModel>? explanationList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: explanationList!.length,
      itemBuilder: (context, index) {
        final interpreter = explanationList![index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ListTile(
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(AppImages.absherSplashImage)),
            title: Text(
              interpreter.ro2yaName,
              style: AppTextStyles.title20Brown,
            ),
            subtitle: Text(
              interpreter.ro2ya,
              overflow: TextOverflow.fade,
              maxLines: 1,
              style: AppTextStyles.title18grey,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Ro2yaDetailsScreen(explanationModel: interpreter)));
            },
          ),
        );
      },
    );
  }
}

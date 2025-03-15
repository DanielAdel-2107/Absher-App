import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/widgets/custom_text_button.dart';
import 'package:absher_app/features/user/profile/provider/profile_provider.dart';
import 'package:absher_app/features/user/profile/widgets/ro2ya_details.dart';
import 'package:absher_app/features/user/profile/widgets/ro2ya_feedback_user.dart';
import 'package:absher_app/features/models/explanation_model.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

class DetailsScreenbody extends StatelessWidget {
  const DetailsScreenbody({
    super.key,
    required this.explanationModel,
  });
  final ExplanationModel explanationModel;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context, provider, child) {
      return LiquidPullToRefresh(
        color: AppColors.brownColor,
        showChildOpacityTransition: false,
        onRefresh: () async {
          provider.reloadRo2ya(id: explanationModel.id);
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Ro2yaDetails(
                  explanationModel:
                      provider.explanationModel ?? explanationModel,
                  icon: provider.isPlaying ? Icons.pause : Icons.play_arrow,
                  onPressed: () {
                    provider.isPlaying
                        ? provider.stopPlayRecording()
                        : provider.playRecording(explanationModel.ro2yaUrl!);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                Ro2yaFeedback(explanationModel: explanationModel),
              ],
            ),
          ),
        ),
      );
    });
  }
}

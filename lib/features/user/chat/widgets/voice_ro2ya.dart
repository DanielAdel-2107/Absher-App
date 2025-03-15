import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/features/user/chat/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VoiceRo2ya extends StatelessWidget {
  const VoiceRo2ya({
    super.key,
    required this.provider,
  });
  final ChatProvider provider;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.brownColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.1,
              vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "رساله صوتيه",
                style: AppTextStyles.title20LightBrown,
              ),
              IconButton(
                onPressed: () {
                  provider.isPlaying
                      ? provider.stopPlayRecording()
                      : provider
                          .playRecording(provider.explanationModel!.ro2yaUrl!);
                },
                icon: Icon(
                  provider.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: AppColors.lightBrownColor,
                ),
              )
            ],
          ),
        ));
  }
}

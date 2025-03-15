import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/widgets/custom_text_button.dart';
import 'package:absher_app/features/user/ro2ya/provider/steps_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class RecordAudio extends StatelessWidget {
  const RecordAudio({
    super.key,
    required this.provider,
  });

  final StepsProvider provider;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          provider.isRecording
              ? Lottie.asset(
                  'assets/lottie/Animation - 1739893084086.json',
                  width: 100,
                )
              : SizedBox(),
          provider.saveRecord && !provider.isRecording
              ? CustomTextButton(
                  title: !provider.isPlaying ? "سماع التسجيل" : "ايقاف التسجيل",
                  color: AppColors.brownColor,
                  onPressed: () {
                    provider.isPlaying
                        ? provider.stopPlayRecording()
                        : provider.playRecording();
                  })
              : SizedBox(),
          IconButton(
            icon:
                Icon(provider.isRecording ? Icons.stop : Icons.mic, size: 50.w),
            onPressed: provider.isRecording
                ? provider.stopRecording
                : provider.startRecording,
          ),
          SizedBox(height: 10),
          if (provider.isRecording)
            Text(
              "الوقت المتبقي: ${provider.remainingTime ~/ 60}:${(provider.remainingTime % 60).toString().padLeft(2, '0')}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }
}

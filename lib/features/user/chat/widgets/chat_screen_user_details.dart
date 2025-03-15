import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChatScreenUserDetails extends StatelessWidget {
  const ChatScreenUserDetails({
    super.key,
    required this.title,
    required this.value,
  });
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.title20greyBold,
          ),
          Text(
            value,
            style: AppTextStyles.title20Brown,
          ),
        ],
      ),
    );
  }
}

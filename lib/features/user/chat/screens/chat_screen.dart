import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/features/user/chat/provider/chat_provider.dart';
import 'package:absher_app/features/user/chat/widgets/chat_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'المحادثه',
              style: AppTextStyles.title20White,
            ),
            centerTitle: true,
            backgroundColor: AppColors.brownColor,
            foregroundColor: Colors.white,
            actions: [
            provider.userRole == 'interpreter' ?  IconButton(
                onPressed: () {
                  provider.toggleUserDetails();
                },
                icon: Icon(
                  provider.showUserDetails
                      ? Icons.arrow_circle_up_rounded
                      : Icons.arrow_circle_down_rounded,
                  color: Colors.white,
                ),
              ):SizedBox(),
            ],
          ),
          body: ChatScreenBody(
            provider: provider,
          ),
        );
      },
    );
  }
}

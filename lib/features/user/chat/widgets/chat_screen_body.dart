import 'package:absher_app/core/assets/images/app_images.dart';
import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/features/user/chat/provider/chat_provider.dart';
import 'package:absher_app/features/user/chat/widgets/chat_list_view.dart';
import 'package:absher_app/features/user/chat/widgets/interpreter_operations.dart';
import 'package:absher_app/features/user/chat/widgets/send_message.dart';
import 'package:absher_app/features/user/chat/widgets/text_ro2ya.dart';
import 'package:absher_app/features/user/chat/widgets/user_details.dart';
import 'package:absher_app/features/user/chat/widgets/user_operations.dart';
import 'package:absher_app/features/user/chat/widgets/voice_ro2ya.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreenBody extends StatelessWidget {
  const ChatScreenBody({
    super.key,
    required this.provider,
  });
  final ChatProvider provider;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(AppImages.absherLogoImage),
          Column(
            children: [
              Expanded(
                child: provider.loadChats == false
                    ? Center(child: CircularProgressIndicator(
                      color: AppColors.brownColor,
                    ))
                    : ChatListView(provider: provider),
              ),
              SendMessage(
                onPressed: () {
                  provider.sendMessage(
                      message: provider.messageController.text);
                },
                controller: provider.messageController,
                enabled: (provider.ro2yaReturned ||
                        provider.doneExplanation ||
                        provider.delete ||
                        provider.close)
                    ? false
                    : true,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: provider.userRole == 'interpreter'
                    ? InterpreterOptions(provider: provider)
                    : UserOptions(
                        onPressed: () {
                          provider.returnRo2ya(context: context);
                        },
                      ),
              )
            ],
          ),
          provider.showUserDetails
              ? provider.userRole == 'interpreter'
                  ? Positioned(
                      top: 0,
                      right: 10,
                      left: 10,
                      child: UserDetails(
                        explanationModel: provider.explanationModel!,
                      ),
                    )
                  : SizedBox()
              : SizedBox(),
        ],
      ),
    );
  }
}

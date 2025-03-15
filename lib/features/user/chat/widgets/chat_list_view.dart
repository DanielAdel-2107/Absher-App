import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/features/user/chat/provider/chat_provider.dart';
import 'package:absher_app/features/user/chat/widgets/ro2ya_card_state.dart';
import 'package:absher_app/features/user/chat/widgets/text_ro2ya.dart';
import 'package:absher_app/features/user/chat/widgets/voice_ro2ya.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({
    super.key,
    required this.provider,
  });

  final ChatProvider provider;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (provider.userRole == 'interpreter')
            provider.explanationModel?.ro2yaUrl == null
                ? TextRo2ya(ro2ya: provider.explanationModel?.ro2ya ?? "لا يوجد نص للرؤيا")
                : VoiceRo2ya(provider: provider),

          provider.chatList.isEmpty
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.lightBrownColor,
                      ),
                      child: Text(
                        'لا توجد رسائل',
                        style: AppTextStyles.title28Brown,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true, // يسمح لقائمة الرسائل بأن تأخذ فقط المساحة المطلوبة داخل الـ Column
                  physics: NeverScrollableScrollPhysics(), // يمنع التمرير داخل ListView
                  padding: EdgeInsets.symmetric(vertical: 12),
                  itemCount: provider.chatList.length,
                  itemBuilder: (context, index) {
                    return BubbleSpecialThree(
                      isSender: provider.chatList[index].id == provider.userId,
                      text: provider.chatList[index].id == provider.userId
                          ? "انت : ${provider.chatList[index].message}"
                          : provider.chatList[index].message,
                      color: provider.chatList[index].id == provider.userId
                          ? AppColors.brownColor
                          : AppColors.lightBrownColor,
                      tail: true,
                      textStyle: TextStyle(color: Colors.white, fontSize: 18),
                    );
                  },
                ),

          if (provider.doneExplanation)
            Ro2yaCardState(message: "تم التفسير"),
          if (provider.ro2yaReturned)
            Ro2yaCardState(message: "تم ارجاع الرؤيا الي الشيخ"),
          if (provider.close)
            Ro2yaCardState(message: "تم اغلاق المحادثه من الشيخ"),
          if (provider.delete)
            Ro2yaCardState(message: "تم حذف المحادثه من الشيخ"),
        ],
      ),
    );
  }
}

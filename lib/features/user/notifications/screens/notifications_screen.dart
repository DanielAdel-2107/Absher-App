import 'package:absher_app/features/admin/widgets/custom_app_bar.dart';
import 'package:absher_app/features/user/notifications/widgets/notifications_screen_body.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        enabledMenu: false,
        enableActions: false,
        title: "الاشعارات",
      ),
      body: NotificationsScreenBody(),
    );
  }
}

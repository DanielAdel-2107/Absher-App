import 'package:absher_app/core/dependancy_injection/dependancy_injection.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/features/user/notifications/provider/notifications_provider.dart';
import 'package:absher_app/features/user/notifications/widgets/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationsScreenBody extends StatelessWidget {
  const NotificationsScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationsProvider>(builder: (context, provider, child) {
      return provider.loadnotifications
          ? provider.notifications.isEmpty
              ? Center(
                  child: Text(
                  "لا توجد اشعارات",
                  style: AppTextStyles.title28Brown,
                ))
              : ListView.builder(
                  itemCount: provider.notifications.length,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  itemBuilder: (context, index) {
                    return NotificationCard(
                      title: provider.notifications[index].title,
                      subTitle: provider.notifications[index].message,
                    );
                  },
                )
          : Center(child: CircularProgressIndicator());
    });
  }
}

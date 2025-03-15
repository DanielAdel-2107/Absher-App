import 'dart:async';
import 'dart:developer';
import 'package:absher_app/core/notifications/local_notifications_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Stream<List<Map<String, dynamic>>> getUnreadNotificationsStream(
    {required String userId}) {
  final supabase = Supabase.instance.client;
  return supabase
      .from('notifications')
      .stream(primaryKey: ['id'])
      .eq('user_id', userId)
      .map((data) {
        final notifications = List<Map<String, dynamic>>.from(data);
        // فلترة إضافية باستخدام where
        return notifications.where((notification) {
          return notification['is_read'] == false;
        }).toList();
      });
}

StreamSubscription? unreadNotificationsSubscription;

void handleUnreadNotificationsStream({required String userId}) {
  final unreadNotificationsStream =
      getUnreadNotificationsStream(userId: userId);
  int notificationIdCounter = 0;
  unreadNotificationsSubscription = unreadNotificationsStream.listen(
    (notifications) async {
      for (var notification in notifications) {
        log('Handling notification: $notification');
        try {
          LocalNotificationsServices.showBasicNotification(
            body: notification['message'],
            title: notification['title'],
            id: notificationIdCounter,
          );
          notificationIdCounter++;
          await markAsRead(notification['id']);
        } catch (e) {
          log('Error handling notification: $e');
        }
      }
    },
  );
}

void stopUnreadNotificationsStream() {
  unreadNotificationsSubscription?.cancel();
  unreadNotificationsSubscription = null;
}

Future<void> markAsRead(String notificationId) async {
  final supabase = Supabase.instance.client;

  try {
    final response = await supabase
        .from('notifications')
        .update({'is_read': true}).eq('id', notificationId);

    if (response.error != null) {
      log('Error marking notification as read: ${response.error!.message}');
    } else {
      log('Notification marked as read');
    }
  } catch (e) {
    log('Exception occurred while marking as read: $e');
  }
}

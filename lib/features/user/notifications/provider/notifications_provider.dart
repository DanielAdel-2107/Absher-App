import 'dart:developer';
import 'package:absher_app/features/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationsProvider with ChangeNotifier {
  List<NotificationModel> notifications = [];
  bool loadnotifications = false;
  static final supabase = Supabase.instance.client;
  final userId = supabase.auth.currentUser!.id;

  NotificationsProvider() {
    getNotifications();
  }
  getNotifications() async {
    try {
      supabase
          .from('notifications')
          .stream(primaryKey: ['id'])
          .eq("user_id", userId)
          .listen((value) {
            notifications =
                value.map((e) => NotificationModel.fromJson(e)).toList();
            loadnotifications = true;
            notifyListeners();
          });
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}

import 'package:absher_app/app/my_app.dart';
import 'package:absher_app/core/dependancy_injection/dependancy_injection.dart';
import 'package:absher_app/core/notifications/local_notifications_services.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await LocalNotificationsServices.init();
  await Supabase.initialize(
    url: "your supabase url",
    anonKey: "your supabase anon key",
  );

  runApp(
    DevicePreview(
    enabled: false,
    builder: (context) =>
    MyApp(),
    )
  );
}

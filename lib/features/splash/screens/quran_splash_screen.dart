import 'dart:async';
import 'dart:developer';
import 'package:absher_app/core/notifications/show_notification.dart';
import 'package:absher_app/core/routing/app_routes.dart';
import 'package:absher_app/features/splash/widgets/quran_splash_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class QuranSplashScreen extends StatefulWidget {
  const QuranSplashScreen({super.key});

  @override
  State<QuranSplashScreen> createState() => _QuranSplashScreenState();
}

class _QuranSplashScreenState extends State<QuranSplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToAbsherSplashScreen();
  }

  Future<void> navigateToAbsherSplashScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    final supabase = Supabase.instance.client;
    if (supabase.auth.currentUser != null) {
      try {
        final userId = supabase.auth.currentUser!.id;
        final data = await supabase
            .from("users")
            .select("role")
            .eq("id", userId)
            .single();
        handleUnreadNotificationsStream(
          userId: userId,
        );
        if (data['role'] == "user") {
          Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
        } else {
          Navigator.pushReplacementNamed(context, AppRoutes.homeScreenForAdmin);
        }
      } catch (e) {
        log("Error fetching user data: $e");
        Navigator.pushReplacementNamed(context, AppRoutes.absherSplasheScreen);
      }
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.absherSplasheScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const QuranSplashScreenBody(),
    );
  }
}

import 'package:absher_app/features/admin/screens/dashboard/screens/dashboard_screen.dart';
import 'package:absher_app/features/admin/screens/home/screens/home_screen_for_admin.dart';
import 'package:absher_app/features/admin/screens/profile/screens/profile_screen.dart';
import 'package:absher_app/features/auth/create_interpreter_account/screens/create_interpreter_account_screen.dart';
import 'package:absher_app/features/auth/create_interpreter_account/screens/terms_of_joining_screen.dart';
import 'package:absher_app/features/auth/login/screens/login_screen.dart';
import 'package:absher_app/features/auth/register/screens/register_screen.dart';
import 'package:absher_app/features/user/about_us/screens/about_us_screen.dart';
import 'package:absher_app/features/user/chat/screens/chat_screen.dart';
import 'package:absher_app/features/user/home/screens/home_screen.dart';
import 'package:absher_app/features/user/notifications/screens/notifications_screen.dart';
import 'package:absher_app/features/user/payment/screens/payment_Screen.dart';
import 'package:absher_app/features/user/profile/screens/profile_screen.dart';
import 'package:absher_app/features/user/ro2ya/screens/steps_screen.dart';
import 'package:absher_app/features/splash/screens/absher_splash_screen.dart';
import 'package:absher_app/features/splash/screens/quran_splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
//  app route
  static final Map<String, Widget Function(BuildContext)> routes = {
    quranSplashScreen: (context) => QuranSplashScreen(),
    absherSplasheScreen: (context) => AbsherSplashScreen(),
    loginScreen: (context) => LoginScreen(),
    registerScreen: (context) => RegisterScreen(),
    homeScreen: (context) => HomeScreen(),
    stepScreen: (context) => StepsScreen(),
    homeScreenForAdmin: (context) => HomeScreenForAdmin(),
    profileScreen: (context) => ProfileScreen(),
    dashboardScreen: (context) => DashboardScreen(),
    aboutUsScreen: (context) => AboutUsPage(),
    paymentScreen: (context) => PaymentScreen(),
    chatScreen: (context) => ChatScreen(),
    termsOfJoiningScreen: (context) => TermsOfJoiningScreen(),
    createInterpreterAccountScreen: (context) =>
        CreateInterpreterAccountScreen(),
    notificationsScreen: (context) => NotificationsScreen(),
    adminProfileScreen: (context) => AdminProfileScreen(),
  };
// route names
  static const String quranSplashScreen = '/quranSplashScreen';
  static const String absherSplasheScreen = '/absherSplasheScreen';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String homeScreen = '/homeScreen';
  static const String homeScreenForAdmin = '/homeScreenForAdmin';
  static const String stepScreen = '/stepScreen';
  static const String ro2yaDetailsScreen = '/ro2yaDetailsScreen';
  static const String profileScreen = '/profileScreen';
  static const String dashboardScreen = '/dashboardScreen';
  static const String aboutUsScreen = '/aboutUsScreen';
  static const String paymentScreen = '/paymentScreen';
  static const String chatScreen = '/chatScreen';
  static const String createInterpreterAccountScreen =
      '/createInterpreterAccountScreen';
  static const String termsOfJoiningScreen = '/termsOfJoiningScreen';
  static const String notificationsScreen = '/notificationsScreen';
  static const String adminProfileScreen = '/adminProfileScreen';
}

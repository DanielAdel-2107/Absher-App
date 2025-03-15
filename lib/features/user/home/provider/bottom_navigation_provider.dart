import 'package:absher_app/features/user/about_us/screens/about_us_screen.dart';
import 'package:absher_app/features/user/home/screens/home_screen_for_user.dart';
import 'package:absher_app/features/user/notifications/screens/notifications_screen.dart';
import 'package:absher_app/features/user/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;
  List<Widget> screens = [
    HomeScreenForUser(),
    ProfileScreen(),
    NotificationsScreen(),
    AboutUsPage(),
  ];
  int get currentIndex => _currentIndex;
  void changeIndex(int index) {
      _currentIndex = index;
      notifyListeners();
  }
}

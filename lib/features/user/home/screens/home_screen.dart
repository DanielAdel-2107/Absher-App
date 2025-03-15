import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:absher_app/core/dependancy_injection/dependancy_injection.dart';
import 'package:absher_app/features/user/home/provider/bottom_navigation_provider.dart';
import 'package:absher_app/features/user/home/widgets/add_ro2ya_button.dart';
import 'package:absher_app/features/user/home/widgets/custom_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => locator<BottomNavigationBarProvider>(),
      child: Consumer<BottomNavigationBarProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: provider.screens[provider.currentIndex],
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: AddRo2yaButton(),
            bottomNavigationBar: CustomBottomAppBar(
              onTap: (index) => provider.changeIndex(index),
              currentIndex: provider.currentIndex,
            ),
          );
        },
      ),
    );
  }
}

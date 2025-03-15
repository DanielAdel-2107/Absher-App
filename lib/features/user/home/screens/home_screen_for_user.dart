import 'package:absher_app/features/admin/widgets/custom_app_bar.dart';
import 'package:absher_app/features/user/home/widgets/home_screen_body.dart';
import 'package:absher_app/features/user/home/widgets/modern_drawer_for_user.dart';
import 'package:flutter/material.dart';

class HomeScreenForUser extends StatelessWidget {
  HomeScreenForUser({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
      ),
      endDrawer: Drawer(
        child: ModernDrawerForUser(),
      ),
      body: HomeScreenBody(),
    );
  }
}

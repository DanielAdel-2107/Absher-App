import 'package:absher_app/features/admin/widgets/admin_moden_drawer.dart';
import 'package:absher_app/features/admin/widgets/custom_app_bar.dart';
import 'package:absher_app/features/admin/widgets/home_screen_for_admin_body.dart';
import 'package:flutter/material.dart';

class HomeScreenForAdmin extends StatelessWidget {
  const HomeScreenForAdmin({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: ModernDrawerForAdmin(),
      body: HomeScreenForAdminBody(),
    );
  }
}

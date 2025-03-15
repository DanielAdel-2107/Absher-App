import 'package:absher_app/features/admin/screens/profile/widgets/admin_profile_screen_body.dart';
import 'package:absher_app/features/admin/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AdminProfileScreen extends StatelessWidget {
  const AdminProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        enableActions: false,
        enabledMenu: false,
        title: "الصفحه الشخصيه",
      ),
      body: AdminProfileScreenBody(),
    );
  }
}

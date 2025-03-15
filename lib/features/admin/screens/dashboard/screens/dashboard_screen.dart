import 'package:absher_app/features/admin/widgets/custom_app_bar.dart';
import 'package:absher_app/features/admin/screens/dashboard/widgets/dash_board_screen_body.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          enabledMenu: false,
        ),
        body: DashBoardScreenBody());
  }
}

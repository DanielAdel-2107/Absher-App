import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/features/user/profile/widgets/tab_bar_view_body.dart';
import 'package:flutter/material.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('بيانات المستخدم'),
        backgroundColor: AppColors.lightBrownColor,
        bottom: TabBar(
          labelStyle: AppTextStyles.title18Brown,
          tabs: [
            Tab(icon: Icon(Icons.person), text: 'البيانات'),
            Tab(
              icon: Icon(Icons.list),
              text: 'الرؤيا',
            ),
          ],
        ),
      ),
      body: TabBarViewBody(),
    );
  }
}

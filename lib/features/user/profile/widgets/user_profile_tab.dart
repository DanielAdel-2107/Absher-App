import 'package:absher_app/core/assets/images/app_images.dart';
import 'package:absher_app/features/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProfileTab extends StatelessWidget {
  const UserProfileTab({super.key, required this.userModel});
  final UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    return userModel == null
        ? Center(child: CircularProgressIndicator())
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(AppImages.absherSplashImage),
                ),
                SizedBox(height: 16),
                Text(
                  userModel!.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(userModel!.email, style: TextStyle(fontSize: 16)),
              ],
            ),
          );
  }
}

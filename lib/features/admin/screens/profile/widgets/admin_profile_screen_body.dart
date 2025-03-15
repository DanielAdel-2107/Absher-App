import 'package:absher_app/core/assets/images/app_images.dart';
import 'package:absher_app/features/admin/screens/home/provider/interpreter_provider.dart';
import 'package:absher_app/features/admin/screens/profile/widgets/profile_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminProfileScreenBody extends StatelessWidget {
  const AdminProfileScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<InterpreterProvider>(builder: (context, provider, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: MediaQuery.sizeOf(context).width / 4,
              backgroundImage: AssetImage(AppImages.absherSplashImage),
            ),
            ProfileData(
              email: provider.userModel!.email,
              name: provider.userModel!.name,
            )
          ],
        ),
      );
    });
  }
}

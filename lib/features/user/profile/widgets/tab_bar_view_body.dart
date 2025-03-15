import 'package:absher_app/features/user/profile/provider/profile_provider.dart';
import 'package:absher_app/features/user/profile/widgets/ro2ya_details_tab.dart';
import 'package:absher_app/features/user/profile/widgets/user_profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabBarViewBody extends StatelessWidget {
  const TabBarViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context, provider, child) {
      return TabBarView(
        children: [
          UserProfileTab(
            userModel: provider.userModel,
          ),
          Ro2yaDetailsTab(
            explanationModelList: provider.interpreterModelList,
          ),
        ],
      );
    });
  }
}

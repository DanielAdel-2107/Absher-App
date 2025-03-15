import 'package:absher_app/features/admin/screens/profile/widgets/custom_admin_profile_card.dart';
import 'package:flutter/material.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({
    super.key,
    required this.name,
    required this.email,
  });
  final String name, email;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        CustomAdminProfileCard(
          title: "الاسم",
          value: name,
        ),
        CustomAdminProfileCard(
          title: "الايميل",
          value: email,
        ),
      ],
    );
  }
}

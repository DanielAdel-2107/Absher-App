import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/notifications/show_notification.dart';
import 'package:absher_app/core/routing/app_routes.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/features/admin/screens/home/provider/interpreter_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ModernDrawerForAdmin extends StatelessWidget {
  const ModernDrawerForAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(child: Consumer<InterpreterProvider>(
      builder: (context, provider, child) {
        return provider.userModel == null
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserDetails(provider: provider),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildDrawerItem(
                          icon: Icons.home,
                          text: 'الصفحه الرئيسيه',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        _buildDrawerItem(
                          icon: Icons.person,
                          text: 'الصفحه الشخصيه',
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.adminProfileScreen);
                          },
                        ),
                        _buildDrawerItem(
                          icon: Icons.settings,
                          text: 'لوحة التحكم',
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(
                                context, AppRoutes.dashboardScreen);
                          },
                        ),
                        _buildDrawerItem(
                          icon: Icons.help,
                          text: 'من نحن',
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.aboutUsScreen);
                          },
                        ),
                      ],
                    ),
                  ),
                  CustomElevatedButtonWithicon(),
                ],
              );
      },
    ));
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.brownColor),
      title: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
      onTap: onTap,
    );
  }
}

class CustomElevatedButtonWithicon extends StatelessWidget {
  const CustomElevatedButtonWithicon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton.icon(
        onPressed: () async {
          await Supabase.instance.client.auth.signOut();
          GoogleSignIn().signOut;
          stopUnreadNotificationsStream();
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.loginScreen, (_) => false);
        },
        icon: Icon(
          Icons.logout,
          color: Colors.white,
        ),
        label: Text(
          'تسجيل الخروج',
          style: AppTextStyles.title20White,
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50), // Full width
          backgroundColor: AppColors.brownColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
    required this.provider,
  });
  final InterpreterProvider provider;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: DrawerHeader(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.brownColor, AppColors.lightBrownColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
            ),
            SizedBox(height: 10),
            Text(
              provider.userModel!.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              provider.userModel!.email,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

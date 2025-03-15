import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/dependancy_injection/dependancy_injection.dart';
import 'package:absher_app/core/notifications/show_notification.dart';
import 'package:absher_app/core/routing/app_routes.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/features/user/home/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ModernDrawerForUser extends StatelessWidget {
  const ModernDrawerForUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ChangeNotifierProvider(
          create: (context) => locator<UserProvider>(),
          child: Consumer<UserProvider>(builder: (context, provider, child) {
            return provider.userModel == null
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      SizedBox(
                        height: 300.h,
                        width: double.infinity,
                        child: DrawerHeader(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.brownColor,
                                AppColors.lightBrownColor
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 40,
                              ),
                              SizedBox(height: 10),
                              Text(provider.userModel?.name ?? "",
                                  style: AppTextStyles.title18White),
                              Text(provider.userModel?.email ?? "",
                                  style: AppTextStyles.title14White),
                            ],
                          ),
                        ),
                      ),

                      // Menu Items
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
                              text: 'الملف الشخصى',
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.profileScreen);
                              },
                            ),
                            _buildDrawerItem(
                              icon: Icons.payment,
                              text: 'بيانات الدفع',
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.paymentScreen);
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
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16, right: 16, bottom: 32, top: 16),
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
                            minimumSize:
                                Size(double.infinity, 50.h),                            backgroundColor: AppColors.brownColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
          })),
    );
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
        style: AppTextStyles.title16Brown,
      ),
      onTap: onTap,
    );
  }
}

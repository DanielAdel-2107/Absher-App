import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/routing/app_routes.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.enabledMenu = true,
    this.enableActions = true,
    this.title = "رؤيا و بشرى",
    this.onPressed,
  });
  final bool enabledMenu;
  final bool enableActions;
  final String title;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.brownColor,
      foregroundColor: Colors.white,
      title: Text(title, style: TextStyle(color: Colors.white)),
      centerTitle: true,
      // leadingWidth: ,
      leading: enabledMenu
          ? IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: onPressed ??
                  () {
                    Scaffold.of(context).openDrawer();
                  },
            )
          : null,
      actions: [
        enabledMenu
            ? IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.notificationsScreen);
                },
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              )
            : SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

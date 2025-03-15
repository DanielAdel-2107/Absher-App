import 'package:absher_app/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide.none,
        ),
        foregroundColor: AppColors.brownColor,
        backgroundColor: Colors.white,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}

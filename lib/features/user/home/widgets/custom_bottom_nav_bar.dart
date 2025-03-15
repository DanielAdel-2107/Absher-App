import 'package:flutter/material.dart';
import 'package:absher_app/core/colors/app_colors.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  final Function(int) onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 4.0, 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, "الرئيسية", 0),
          _buildNavItem(Icons.menu, "رؤياي", 1),
           SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
          _buildNavItem(Icons.notifications, "الإشعارات", 2),
          _buildNavItem(Icons.info, "من نحن", 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: currentIndex == index ? AppColors.brownColor : Colors.grey),
          Text(
            label,
            style: TextStyle(
              color: currentIndex == index ? AppColors.brownColor : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

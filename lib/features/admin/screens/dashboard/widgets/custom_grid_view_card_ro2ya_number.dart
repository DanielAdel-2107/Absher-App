import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/features/admin/screens/dashboard/provider/dashboard_provider.dart';
import 'package:absher_app/features/admin/screens/dashboard/widgets/custom_ro2ya_number_card.dart';
import 'package:flutter/material.dart';

class CustomGridViewCardRo2yaNumber extends StatelessWidget {
  const CustomGridViewCardRo2yaNumber({super.key, required this.provider});
  final DashboardProvider provider;
  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.7, crossAxisCount: 2),
        children: [
          CustomRo2yaNumberCard(
            color: Colors.blue,
            count: provider.waitExplanationRo2ya.length.toString(),
            title: "قيد التفسير",
          ),
          CustomRo2yaNumberCard(
            color: Colors.greenAccent,
            count: provider.inquiryRo2ya.length.toString(),
            title: "قيد الاستفسار",
          ),
          CustomRo2yaNumberCard(
            color: Colors.amber,
            count: provider.explanationDoneRo2ya.length.toString(),
            title: "تم التفسير",
          ),
          CustomRo2yaNumberCard(
            color: AppColors.brownColor,
            count: "0",
            title: "التعليقات",
          ),
        ]);
  }
}

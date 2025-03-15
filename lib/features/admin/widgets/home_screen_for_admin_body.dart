import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/dependancy_injection/dependancy_injection.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/features/admin/screens/home/provider/explanation_provider.dart';
import 'package:absher_app/features/admin/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

class HomeScreenForAdminBody extends StatelessWidget {
  const HomeScreenForAdminBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ExplanationProvider>(
      create: (context) => locator<ExplanationProvider>(),
      child: Consumer<ExplanationProvider>(
        builder: (context, provider, child) {
          if (!provider.dataLoaded) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.newUser == true) {
            return LiquidPullToRefresh(
              color: AppColors.brownColor,
              onRefresh: () async {
                await provider.getUserState();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - kToolbarHeight,
                  child: Center(
                    child: Text(
                      "جارى مراجعة طلبك",
                      style: AppTextStyles.title28Brown,
                    ),
                  ),
                ),
              ),
            );
          }
          if (provider.errorMessage != null) {
            return Center(child: Text('Error: ${provider.errorMessage}'));
          }

          if (provider.interpreterModelList.isEmpty) {
            return Center(
              child: Text(
                "لا توجد رؤيا",
                style: AppTextStyles.title28Brown,
              ),
            );
          }

          return CustomRo2yaListView(
            explanationList: provider.interpreterModelList,
          );
        },
      ),
    );
  }
}

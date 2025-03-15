import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/dependancy_injection/dependancy_injection.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/core/widgets/custom_elevated_button_style_2.dart';
import 'package:absher_app/features/admin/screens/dashboard/provider/dashboard_provider.dart';
import 'package:absher_app/features/admin/screens/dashboard/widgets/custom_grid_view_card_ro2ya_number.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

class DashBoardScreenBody extends StatelessWidget {
  const DashBoardScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => locator<DashboardProvider>(),
      child: Consumer<DashboardProvider>(
        builder: (context, provider, child) {
          return LiquidPullToRefresh(
              color: AppColors.brownColor,
              showChildOpacityTransition: false,
              onRefresh: () async {
                provider.subscribeToExplanationUpdates();
              },
              child: provider.dataLoaded == false
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          provider.available == null
                              ? CircularProgressIndicator()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "الحاله",
                                          style: AppTextStyles.title28Brown,
                                        ),
                                        Spacer(),
                                        Text(
                                          provider.available!
                                              ? "متاح"
                                              : "غير متاح",
                                          style: AppTextStyles.title28Brown,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(
                                          provider.available!
                                              ? Icons.person
                                              : Icons.not_interested_rounded,
                                        )
                                      ],
                                    ),
                                    Switch(
                                      value: provider.available!,
                                      onChanged: (value) {
                                        provider.setState(value);
                                      },
                                    ),
                                  ],
                                ),
                          Text(
                            "كل الرؤى",
                            style: AppTextStyles.title28Brown,
                          ),
                          Text(
                            provider.interpreterModelList.length.toString(),
                            style: AppTextStyles.title28Brown,
                          ),
                          Expanded(
                              child: CustomGridViewCardRo2yaNumber(
                                  provider: provider)),
                          provider.isStateUpdated == true
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : CustomElevatedButtonStyle2(
                                  title: provider.available!
                                      ? "تشغيل الاحالات"
                                      : "ايقاف الاحالات",
                                  color: AppColors.brownColor,
                                  onPressed: () {
                                    provider.updateState();
                                  },
                                )
                        ],
                      ),
                    ));
        },
      ),
    );
  }
}

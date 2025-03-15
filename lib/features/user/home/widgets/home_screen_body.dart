import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/features/user/home/provider/opinions_provider.dart';
import 'package:absher_app/features/user/home/widgets/custom_category_grid_view.dart';
import 'package:absher_app/features/user/home/widgets/hijri_date.dart';
import 'package:absher_app/features/user/home/widgets/mosque_image.dart';
import 'package:absher_app/features/user/home/widgets/ro2ya_from_user_list_view.dart';
import 'package:absher_app/features/user/home/widgets/ro2ya_from_users.dart';
import 'package:absher_app/features/user/home/widgets/send_ro2ya_title.dart';
import 'package:absher_app/features/user/home/widgets/user_feedback.dart';
import 'package:absher_app/features/user/home/widgets/user_feedback_list_view.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HijriCalendar.setLocal('ar');
    HijriCalendar _today = HijriCalendar.now();

    String formattedDate =
        '${_today.getDayName()} ${_today.hDay} ${_today.getLongMonthName()} ${_today.hYear}    &    ${DateTime.now().day} ${DateTime.now().month} ${DateTime.now().year}';

    return Consumer<OpinionsProvider>(builder: (context, provider, child) {
      return LiquidPullToRefresh(
        backgroundColor: AppColors.brownColor,
        onRefresh: () async {
          provider.getOpinions();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                HijriDate(formattedDate: formattedDate),
                CustomCategoryGridView(),
                SendRo2yaTitle(),
                MosqueImage(),
                provider.isdataLoaded
                    ? Column(
                        children: [
                          UsersFeedBack(),
                          UserFeedBackListView(
                            opinionsModel: provider.opinionsModel,
                          ),
                          Ro2yaFormUsers(),
                          Ro2yaFromUsersListView(
                            explanationModel: provider.explanationModel,
                          ),
                        ],
                      )
                    : Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
        ),
      );
    });
  }
}

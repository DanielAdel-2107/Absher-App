import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/features/models/explanation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEplanationRp2ya extends StatelessWidget {
  const CustomEplanationRp2ya({super.key, required this.explanationModel});
  final ExplanationModel explanationModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 200.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.white,
          ),
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Icon(
                  Icons.calendar_month,
                  color: AppColors.brownColor,
                ),
                Text(
                  "  ${explanationModel.createdAt.day}",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    explanationModel.createdAt.month.toString(),
                  ),
                ),
                Text(
                  explanationModel.createdAt.year.toString(),
                ),
                Spacer(),
                Icon(
                  Icons.favorite_border,
                  color: AppColors.brownColor,
                )
              ]),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      explanationModel.ro2ya,
                      style: AppTextStyles.title18Brownsmall,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(child: Icon(Icons.share)),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Divider(
            thickness: 2,
          ),
        ),
      ],
    );
  }
}

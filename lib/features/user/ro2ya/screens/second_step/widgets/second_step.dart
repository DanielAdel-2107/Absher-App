import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/functions/show_error_dialog.dart';
import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/features/user/ro2ya/provider/steps_provider.dart';
import 'package:absher_app/features/user/ro2ya/screens/second_step/widgets/custom_drop_button_form_field.dart';
import 'package:absher_app/features/user/ro2ya/screens/second_step/widgets/record_audio.dart';
import 'package:absher_app/features/user/ro2ya/widgets/custom_step_text_field.dart';
import 'package:flutter/material.dart';

class SecondStepBody extends StatelessWidget {
  const SecondStepBody({
    super.key,
    required this.provider,
  });
  final StepsProvider provider;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: provider.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          CustomStepsTextField(
            hintText: "ادخل عنوان الرؤيا",
            label: "عنوان الرؤيا",
            controller: provider.ro2yaNameController,
            enableValidation: true,
          ),
          CustomStepsTextField(
            hintText: "ادخل وقت الرؤيا",
            label: "وقت الرؤيا ",
            controller: provider.ro2yaTimeController,
            enableValidation: true,
          ),
          Text("الحاله الوظيفيه"),
          CustomDropButtonFormField(
            dataList: provider.employmentStatusList,
            onChanged: (value) {
              provider.employmentStatus = value!;
            },
          ),
          Text("الجنس"),
          CustomDropButtonFormField(
            dataList: provider.genderList,
            onChanged: (value) {
              provider.genderController.text = value!;
            },
          ),
          Text("الحاله الاجتماعيه"),
          CustomDropButtonFormField(
            dataList: provider.maritalStatusList,
            onChanged: (value) {
              provider.maritalStatusController.text = value!;
            },
          ),
          CustomStepsTextField(
            hintText: "ادخل العمر",
            label: "العمر",
            controller: provider.ageController,
            keyboardType: TextInputType.number,
            enableValidation: true,
          ),
          CustomStepsTextField(
            hintText:
                "ادخل معلومات اضافيه مثل ( الحاله الصحيه - نوع الوظيفه...الخ)",
            label: "معلومات اضفافيه ( اختياري )",
            controller: provider.moreDataController,
            enableValidation: true,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "تفعيل التسجيل الصوتي",
                style: AppTextStyles.title18Brown,
              ),
              Switch(
                activeTrackColor: AppColors.brownColor,
                thumbColor: WidgetStateProperty.all(
                  AppColors.lightBrownColor,
                ),
                value: provider.useMic,
                onChanged: (value) {
                  if (provider.index == 2) {
                    provider.turnMic(value);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          "انت لست علي الباقه الذهبيه لم تتمكن من تفعيل الصوت"),
                    ));
                  }
                },
                activeColor: Colors.blue,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey.shade300,
              ),
            ],
          ),
          provider.useMic && !provider.loadMic
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.brownColor,
                  ),
                )
              : provider.useMic
                  ? RecordAudio(provider: provider)
                  : CustomStepsTextField(
                      maxLines: 5,
                      onTap: () {
                        if (provider.index == null) {
                          showErrorDialog(context,
                              "برجاء اختيار الباقه حتى تتمكن من كتابة الرؤيا");
                          FocusManager.instance.primaryFocus?.unfocus();
                        }
                      },
                      enableValidation: true,
                      hintText: "اكتب رؤياك",
                      label: "اكتب رؤياك",
                      controller: provider.ro2yaController,
                      maxLength: provider.index == 1
                          ? 1000
                          : provider.index == 2
                              ? 1500
                              : 1,
                    ),
        ],
      ),
    );
  }
}

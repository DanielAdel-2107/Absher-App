import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/routing/app_routes.dart';
import 'package:absher_app/core/widgets/custom_elevated_button_style_2.dart';
import 'package:flutter/material.dart';

class CreateAccountForInterpreter extends StatelessWidget {
  const CreateAccountForInterpreter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 15,
        children: [
          // Text(
          //   "لانشاء حساب جديد لمفسر الرؤيا برجاء التواصل معنا من خلال مواقعنا",
          //   style: AppTextStyles.title20Brown,
          //   textAlign: TextAlign.center,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     ConectToSocialMedia(
          //       image: AppImages.whatsAppImage,
          //       onTap: () {
          //         String whatsappCountryCode = '+20';
          //         String whatsappNumber = '01501534655';
          //         String url =
          //             'https://wa.me/$whatsappCountryCode$whatsappNumber';
          //         launchUrlSocialMedia(url: url);
          //       },
          //     ),
          //     ConectToSocialMedia(
          //       image: AppImages.faceBookImage,
          //       onTap: () {
          //         String url =
          //             'https://www.facebook.com/ILearnCodeAcademy/?locale=ar_AR';

          //         launchUrlSocialMedia(url: url);
          //       },
          //     ),
          //     ConectToSocialMedia(
          //       image: AppImages.instgramImage,
          //       onTap: () {},
          //     ),
          //   ],
          // )
          // CustomElevatedButtonStyle2(
          //     title: "انشاء حساب مفسر",
          //     color: AppColors.brownColor,
          //     onPressed: () {
          //       Navigator.pushNamed(
          //           context, AppRoutes.createInterpreterAccountScreen);
          //     }),
          CustomElevatedButtonStyle2(
            title: "شروط الانضمام",
            color: AppColors.brownColor,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.termsOfJoiningScreen);
            },
          ),
        ],
      ),
    );
  }
}

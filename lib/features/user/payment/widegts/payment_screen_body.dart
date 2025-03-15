import 'package:absher_app/core/colors/app_colors.dart';
import 'package:absher_app/core/dependancy_injection/dependancy_injection.dart';
import 'package:absher_app/features/user/payment/provider/payment_provider.dart';
import 'package:absher_app/features/user/payment/widegts/payment_screen_title.dart';
import 'package:absher_app/features/user/payment/widegts/payment_type.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

class PaymentScreenBody extends StatelessWidget {
  const PaymentScreenBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => locator<PaymentProvider>()..loadPaymentData(),
      child: Consumer<PaymentProvider>(builder: (context, provider, child) {
        return provider.loadData
            ? Center(child: CircularProgressIndicator())
            : LiquidPullToRefresh(
                color: AppColors.brownColor,
                showChildOpacityTransition: false,
                onRefresh: () async {
                  await provider.loadPaymentData();
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PaymentScreenTitle(),
                        SizedBox(height: 16.0),
                        PaymentType(
                          title: "رقم محفظه انستا باي",
                          subTitle: provider.paymentModel?.instapayEmail == null
                              ? "لم يتم الاضافه"
                              : provider.paymentModel!.instapayEmail!,
                        ),
                        PaymentType(
                          title: "اسم البنك ",
                          subTitle: provider.paymentModel?.bankName == null
                              ? "لم يتم الاضافه"
                              : provider.paymentModel!.bankName!,
                        ),
                        PaymentType(
                          title: "رقم البطاقه البنكيه ",
                          subTitle: provider.paymentModel?.cardNumber == null
                              ? "لم يتم الاضافه"
                              : provider.paymentModel!.cardNumber!,
                        ),
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}

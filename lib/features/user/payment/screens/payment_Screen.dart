import 'package:absher_app/features/admin/widgets/custom_app_bar.dart';
import 'package:absher_app/features/user/payment/widegts/payment_screen_body.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        enableActions: false,
        enabledMenu: false,
      ),
      body: PaymentScreenBody(),
    );
  }
}

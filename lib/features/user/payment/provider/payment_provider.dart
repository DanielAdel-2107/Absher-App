import 'dart:developer';

import 'package:absher_app/features/models/payment_mode.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PaymentProvider with ChangeNotifier {
  bool loadData = false;

  PaymentModel? paymentModel;
  final supabase = Supabase.instance.client;
  loadPaymentData() async {
    loadData = true;
    notifyListeners();
    final data = await supabase.from('payment').select().maybeSingle();
    try {
      if (data != null) {
        paymentModel = PaymentModel.fromJson(data);
      } else {}
    } on Exception catch (e) {
      log(e.toString());
    }
    loadData = false;
    notifyListeners();
  }
}

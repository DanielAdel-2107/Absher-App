import 'package:absher_app/core/functions/show_success_dialog.dart';
import 'package:absher_app/core/routing/app_routes.dart';
import 'package:absher_app/core/services/supabase/auth/sign_up_with_password.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateInterpreterAccountProvider with ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();
  final countryController = TextEditingController();
  String gender = "";
  List<String> saudiCities = [
    "الرياض",
    "جدة",
    "مكة المكرمة",
    "المدينة المنورة",
    "الدمام",
    "تبوك",
    "بريدة",
    "أبها",
    "حائل",
    "نجران",
    "سكاكا",
    "جيزان",
    "الطائف",
    "الخرج",
    "القصيم"
  ];
  final supabase = Supabase.instance.client;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  selectGender({
    required String gender,
  }) {
    this.gender = gender;
    notifyListeners();
  }

  selectCity({
    required String city,
  }) {
    countryController.text = city;
    notifyListeners();
  }

  addRequest({required BuildContext context}) async {
    if (formKey.currentState!.validate() &&
        gender != "" &&
        countryController.text.isNotEmpty) {
      try {
        isLoading = true;
        notifyListeners();
        if (supabase.auth.currentUser == null) {
          await signUp(
            context: context,
            email: emailController.text,
            password: passwordController.text,
            name: nameController.text,
            phone: phoneController.text,
            role: "interpreter",
          );
        }

        if (supabase.auth.currentUser != null) {
          await supabase.from("interpreter_request").upsert({
            "id": supabase.auth.currentUser!.id,
            "name": nameController.text,
            "email": emailController.text,
            "age": ageController.text,
            "phone": phoneController.text,
            "city": countryController.text,
            "gender": gender,
          });

          await supabase.from("interpreter").upsert({
            "id": supabase.auth.currentUser!.id,
            "name": nameController.text,
            "email": emailController.text,
          });

          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.homeScreenForAdmin, (_) => false);
          showSuccessDialog(context, "تم التسجيل بنجاح!");
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("خطأ، الرجاء المحاولة مرة أخرى"),
        ));
      } finally {
        isLoading = false;
        notifyListeners();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("برجاء, اكمال جميع البيانات"),
      ));
    }
  }
}

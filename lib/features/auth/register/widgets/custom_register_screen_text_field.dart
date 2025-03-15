import 'package:absher_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomRegisterScreenTextField extends StatelessWidget {
  const CustomRegisterScreenTextField({
    super.key,
    required this.title,
    required this.controller,
    this.isSecure = false,
  });
  final String title;
  final TextEditingController controller;
  final bool isSecure;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(70),
          topLeft: Radius.circular(70),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CustomTextField(
          title: title,
          isSecure: isSecure,
          controller: controller,
        ),
      ),
    );
  }
}

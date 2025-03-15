import 'package:absher_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomUserDetailsTextField extends StatelessWidget {
  const CustomUserDetailsTextField({
    super.key,
    required this.title,
    required this.icon,
    this.controller,
    this.isSecure = false,
  });
  final String title;
  final IconData icon;
  final TextEditingController? controller;
  final bool isSecure;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Expanded(
          child: CustomTextField(
            title: title,
            controller: controller,
            isSecure: isSecure,
          ),
        ),
      ],
    );
  }
}

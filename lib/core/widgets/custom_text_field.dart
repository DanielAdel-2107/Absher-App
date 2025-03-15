import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.isSecure = false,
    required this.title,
    this.controller,
    this.enabled = true,
  });
  final TextEditingController? controller;
  final String title;
  final bool isSecure, enabled;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => value!.isEmpty ? 'برجاءادخال القيمه' : null,
      controller: controller,
      obscureText: isSecure,
      enabled: enabled,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        label: Center(
          child: Text(title),
        ),
      ),
      textAlign: TextAlign.center,
    );
  }
}

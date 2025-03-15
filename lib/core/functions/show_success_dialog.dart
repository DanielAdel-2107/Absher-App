import 'package:flutter/material.dart';

void showSuccessDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('نجاح'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('موافق'),
        ),
      ],
    ),
  );
}

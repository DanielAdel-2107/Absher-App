import 'package:absher_app/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class SendMessage extends StatelessWidget {
  const SendMessage({
    super.key,
    this.onPressed,
    required this.controller,
    this.enabled = true,
  });
  final Function()? onPressed;
  final bool enabled;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        color: AppColors.brownColor,
      ),
      child: Row(
        spacing: 20,
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: controller,
              enabled: enabled,
              decoration: InputDecoration(
                border: buildBorder(),
                hintText: 'اكتب الرساله هنا',
                hintStyle: TextStyle(color: Colors.white),
                focusedBorder: buildBorder(),
              ),
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.send,
                color: Colors.white,
              ),
              onPressed: onPressed)
        ],
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: Colors.white,
      ),
    );
  }
}

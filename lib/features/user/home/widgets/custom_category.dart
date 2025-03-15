import 'package:flutter/material.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory({super.key, required this.image, required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.purple.shade100,
          child: Image.asset(image),
        ),
        SizedBox(height: 8.0),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.0),
        ),
      ],
    );
  }
}

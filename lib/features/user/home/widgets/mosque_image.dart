import 'package:absher_app/core/assets/images/app_images.dart';
import 'package:flutter/material.dart';

class MosqueImage extends StatelessWidget {
  const MosqueImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(AppImages.mosqueImage),
        ),
      ),
    );
  }
}

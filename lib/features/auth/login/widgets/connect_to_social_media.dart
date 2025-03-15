import 'package:flutter/widgets.dart';

class ConectToSocialMedia extends StatelessWidget {
  const ConectToSocialMedia({
    super.key,
    required this.image,
    this.onTap,
  });
  final String image;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          image,
          height: 50,
        ),
      ),
    );
  }
}

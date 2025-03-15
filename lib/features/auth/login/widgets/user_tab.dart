import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserTab extends StatelessWidget {
  const UserTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.8,
      child: Tab(
        child: Text(
          'مستخدم',
        ),
      ),
    );
  }
}

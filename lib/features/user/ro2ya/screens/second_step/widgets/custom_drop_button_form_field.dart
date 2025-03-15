import 'package:absher_app/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropButtonFormField extends StatelessWidget {
  const CustomDropButtonFormField({
    super.key,
    required this.dataList,
    this.onChanged,
  });
  final List<String> dataList;
  final Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      validator: (value) => value == null ? "من فضلك اختر قيمه " : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.brownColor),
        ),
      ),
      focusColor: AppColors.brownColor,
      borderRadius: BorderRadius.circular(16),
      hint: Text("الحاله الوظيفيه"),
      items: dataList
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: onChanged,
    );
  }
}

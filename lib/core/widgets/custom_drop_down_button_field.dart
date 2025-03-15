import 'package:absher_app/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropDownButtonFormField extends StatelessWidget {
  const CustomDropDownButtonFormField({
    super.key,
    required this.title,
    required this.dataList,
    this.onChanged,
  });
  final String title;
  final List<String> dataList;
  final Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.brownColor),
        ),
      ),
      focusColor: AppColors.brownColor,
      borderRadius: BorderRadius.circular(16),
      hint: Text(title),
      items: dataList
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: onChanged,
    );
  }
}

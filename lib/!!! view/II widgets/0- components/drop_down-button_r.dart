import 'package:flutter/material.dart';

import '../../../!! data/themes/color/app_colors.dart';

class DropDownButtonRoot extends StatelessWidget {
  final List<DropdownMenuItem<String>>? items;
  final String value;
  final Function(String?) onChange;

  const DropDownButtonRoot(
      {super.key,
      required this.items,
      required this.value,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 15, top: 0, bottom: 0),
          filled: true,
          fillColor: AppColors.backgroundColor,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.primaryColor)),
          focusColor: AppColors.primaryColor,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor, width: 2))),
      style: TextStyle(fontSize: 14),
      hint: const Text('Select Project'),
      items: items,
      value: value,
      onChanged: (value) {
        onChange(value);
      },
    );
  }
}

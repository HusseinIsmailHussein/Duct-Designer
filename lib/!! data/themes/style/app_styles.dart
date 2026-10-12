import 'package:duct_area_app/!!%20data/themes/color/app_colors.dart';
import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:flutter/material.dart';

class AppStyles {
  //! Buttons
  static ButtonStyle buttonStyle = TextButton.styleFrom(
      foregroundColor: Colors.blue,
      backgroundColor: AppColors.primaryColor,
      padding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));

  static ButtonStyle socialButtonStyle = TextButton.styleFrom(
      foregroundColor: Colors.blue,
      backgroundColor: Colors.grey[300],
      padding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));

  //! textFormFieldDecoration
  static InputDecoration textFormFieldDecorationDimensions = InputDecoration(
      contentPadding: EdgeInsets.all(0),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      filled: true,
      fillColor: AppColors.backgroundColor);

  InputDecoration textFormFieldDecoration({required String hint}) =>
      InputDecoration(
        hintText: hint,
        hintStyle: TextStyles.hint,
      );

  //! DropDownButton
  static InputDecoration dropdownButtonDecoration = InputDecoration(
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
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2)));

  //! TextStyle
}

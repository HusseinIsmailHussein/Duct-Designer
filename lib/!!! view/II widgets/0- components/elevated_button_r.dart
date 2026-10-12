import 'package:flutter/material.dart';
import '../../../!! data/themes/color/app_colors.dart';

class ElevatedButtonRoot extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double margin;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;

  const ElevatedButtonRoot(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.margin = 10,
      this.backgroundColor = AppColors.primaryColor,
      this.textColor = AppColors.backgroundColor,
      this.fontSize = 20,
      this.fontWeight = FontWeight.bold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: margin),
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: AppColors.primaryColor)),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: textColor, fontWeight: fontWeight, fontSize: fontSize),
        ),
      ),
    );
  }
}

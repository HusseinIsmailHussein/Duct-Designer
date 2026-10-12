import 'package:flutter/material.dart';
import '../../../!! data/themes/color/app_colors.dart';

class ButtonTypeA extends StatelessWidget {
  final String text;
  final Function onPressed;

  const ButtonTypeA({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryColor,
          backgroundColor: AppColors.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColors.backgroundColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
    );
  }
}

import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:flutter/material.dart';
import '../../../!! data/themes/style/app_styles.dart';

class ButtonSocial extends StatelessWidget {
  const ButtonSocial({
    Key? key,
    required this.text,
    required this.imageLocation,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final String imageLocation;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: AppStyles.socialButtonStyle,
      child: Row(
        children: [
          Image.asset(imageLocation, height: 20),
          const SizedBox(width: 60),
          Text(
            text,
            style: TextStyles.bodyBold,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

import 'package:duct_area_app/!!%20data/themes/style/button_style.dart';
import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:flutter/material.dart';

class ButtonConfirm extends StatelessWidget {
  const ButtonConfirm({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyles.confirm,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyles.button,
      ),
    );
  }
}

import 'package:duct_area_app/!!%20data/themes/color/app_colors.dart';
import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:flutter/material.dart';

class TextFormFieldRoot extends StatelessWidget {
  final String text;
  final String initialValue;
  final Function onSaved;
  final Function validator;
  final Icon icon;
  const TextFormFieldRoot({
    Key? key,
    required this.text,
    required this.onSaved,
    required this.validator,
    required this.icon,
    this.initialValue = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
        child: TextFormField(
          onSaved: (value) => onSaved(value),
          validator: (value) => validator(value),
          initialValue: initialValue,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(2),
              labelText: text,
              filled: true,
              fillColor: AppColors.backgroundColor,
              prefixIcon: icon,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          style: TextStyles.body,
        ));
  }
}

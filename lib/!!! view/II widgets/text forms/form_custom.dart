import 'package:duct_area_app/!!%20data/themes/style/app_styles.dart';
import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:flutter/material.dart';

class FormCustom extends StatelessWidget {
  const FormCustom({
    Key? key,
    required this.text,
    required this.hint,
    required this.onSaved,
    required this.validator,
    this.initialValue = '',
  }) : super(key: key);
  final String text;
  final String hint;
  final String initialValue;
  final Function onSaved;
  final Function validator;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Text(text, style: TextStyles.bodyBold),
            TextFormField(
              onSaved: (value) => onSaved(value),
              validator: (value) => validator(value),
              initialValue: initialValue,
              decoration: AppStyles().textFormFieldDecoration(hint: hint),
              style: TextStyles.body,
            )
          ],
        ));
  }
}

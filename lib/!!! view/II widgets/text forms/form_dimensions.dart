import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:flutter/material.dart';

import '../../../!! data/themes/style/app_styles.dart';

class FormDimensions extends StatelessWidget {
  const FormDimensions({
    Key? key,
    required this.text,
    required this.unit,
    required this.hint,
    required this.initialValue,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);
  final String text;
  final String unit;
  final String hint;
  final String initialValue;
  final Function onChanged;
  final Function validator;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 70, child: Text(text, style: TextStyles.bodyBold)),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SizedBox(
            width: 60,
            height: 30,
            child: TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              initialValue: initialValue,
              style: TextStyles.body,
              onChanged: (value) => onChanged(value),
              validator: (value) => validator(value),
              decoration: AppStyles.textFormFieldDecorationDimensions,
            ),
          ),
        ),
        Text(
          unit,
        ),
      ],
    );
  }
}

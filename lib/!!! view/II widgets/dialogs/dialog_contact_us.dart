import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Widget showDialogContactUs(BuildContext context) {
  return CupertinoAlertDialog(
    title: Text(
      'Contact Us',
      style: TextStyles.messageHeader,
    ),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Blueprint Engineering Solution',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text('Email:'),
        Text('blueprint.engineering.solution@gmail.com'),
      ],
    ),
    actions: [
      CupertinoDialogAction(
        child: Text('OK'),
        onPressed: () => Get.back(),
      )
    ],
  );
}

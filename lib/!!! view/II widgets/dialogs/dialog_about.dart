import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Widget showDialogAbout(BuildContext context) {
  return CupertinoAlertDialog(
    title: Text(
      'Duct Area Calculator App',
      style: TextStyles.messageHeader,
    ),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Version: 1.07', style: TextStyles.messageBody),
        Text('Updated on: March 8, 2023', style: TextStyles.messageBody)
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

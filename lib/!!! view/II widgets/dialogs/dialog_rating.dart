import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

Widget showDialogRating(BuildContext context) {
  return CupertinoAlertDialog(
    title: Text(
      'Rate Us',
      style: TextStyles.messageHeader,
    ),
    content: Center(
      child: RatingBar.builder(
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {},
        updateOnDrag: true,
      ),
    ),
    actions: [
      CupertinoDialogAction(
        child: Text(
          'OK',
          style: TextStyles.messageConfirm,
        ),
        onPressed: () => Get.back(),
      )
    ],
  );
}

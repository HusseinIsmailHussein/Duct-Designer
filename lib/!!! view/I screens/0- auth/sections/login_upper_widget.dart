import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginUpperWidget extends StatelessWidget {
  final String header;
  final String line1;
  final String line2;

  const LoginUpperWidget(
      {super.key,
      this.header = 'header',
      this.line1 = 'Line #1',
      this.line2 = 'Line #2'});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        Positioned(
            top: 60,
            left: 10,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Get.back();
              },
            )),
        Positioned(
          top: 50,
          left: Get.width / 2 - 30,
          child: Container(
            width: 60,
            height: 60,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              'assets/icons/app_icon.png',
            ),
          ),
        ),
        Positioned(
            top: 130,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  header,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  line1,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Text(
                  line2,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                )
              ],
            ))
      ],
    ));
  }
}

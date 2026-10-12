import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../!! data/themes/color/app_colors.dart';

class LayoutSignIn extends StatelessWidget {
  final Widget upperWidget;
  final Widget midWidget;
  final Widget lowerWidget;
  final double midHeight;

  LayoutSignIn({
    Key? key,
    this.upperWidget = const Center(child: Text('upperWidget')),
    this.midWidget = const Center(child: Text('midWidget')),
    this.lowerWidget = const Center(child: Text('lowerWidget')),
    this.midHeight = 300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: AppColors.backgroundColor,
      child: Stack(
        children: [
          Container(
              width: Get.width,
              height: Get.height / 2,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: upperWidget),
          Positioned(
            top: Get.height / 3,
            left: 30,
            child: Column(
              children: [
                Container(
                    height: midHeight,
                    width: Get.width - 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: midWidget),
                Container(width: Get.width - 60, child: lowerWidget)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

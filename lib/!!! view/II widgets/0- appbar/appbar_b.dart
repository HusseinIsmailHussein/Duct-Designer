import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../!! data/themes/color/app_colors.dart';
import '../../I screens/0- home/onboarding_view.dart';

class AppBarB extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  const AppBarB({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      foregroundColor: Colors.white,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool('showHome', false);
              Get.to(() => OnboardingView());
            },
            icon: Icon(
              FontAwesomeIcons.powerOff,
              size: 28,
            ))
      ],
      title: Text(text,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
      backgroundColor: AppColors.primaryColor,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite, 60);
}

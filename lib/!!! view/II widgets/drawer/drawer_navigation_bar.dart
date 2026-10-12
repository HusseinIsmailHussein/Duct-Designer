import 'package:duct_area_app/!!!%20view/II%20widgets/dialogs/dialog_contact_us.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/drawer/drawer_items.dart';
import 'package:duct_area_app/!!%20data/themes/color/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../../../! core/functions/methods.dart';
import '../../../!! data/themes/style/text_style.dart';
import '../dialogs/dialog_about.dart';
import '../dialogs/dialog_rating.dart';

class DrawerNavigationSideBar extends StatelessWidget {
  DrawerNavigationSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width * .65,
      backgroundColor: Colors.grey.shade400,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Name: Guest', style: TextStyles.sidebarBody),
            accountEmail: Text('Email: -', style: TextStyles.sidebarBody),
            currentAccountPicture: CircleAvatar(
                child: ClipOval(
                    child: Image.asset('assets/images/profile.png',
                        width: 90, height: 90, fit: BoxFit.cover))),
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
          ),
          DrawerItem(
              icon: FontAwesomeIcons.productHunt,
              text: 'Install Pro App',
              onTap: () => Methods().goToLink(
                  'https://play.google.com/store/apps/details?id=com.blueprint.duct_area_pro_app')),
          DrawerItem(
              icon: FontAwesomeIcons.unity,
              text: 'More Apps',
              onTap: () => Methods().goToLink(
                  'https://play.google.com/store/apps/developer?id=Blueprint+Engineering+Solution')),
          DrawerItem(
              icon: Icons.email,
              text: 'Contact Us',
              onTap: () => showCupertinoDialog(
                  context: context, builder: showDialogContactUs)),
          DrawerItem(
              icon: Icons.share,
              text: 'Share',
              onTap: () {
                Share.share(
                    'https://play.google.com/store/apps/details?id=com.blueprint.duct_area_app&pli=1');
              }),
          DrawerItem(
              icon: Icons.star_rate,
              text: 'Rate Us',
              onTap: () => showCupertinoDialog(
                  context: context, builder: showDialogRating)),
          DrawerItem(
              icon: Icons.help,
              text: 'About',
              onTap: () => showCupertinoDialog(
                  context: context, builder: showDialogAbout)),
        ],
      ),
    );
  }
}

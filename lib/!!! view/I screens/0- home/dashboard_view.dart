import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/0-%20appbar/appbar_a.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/drawer/drawer_navigation_bar.dart';
import 'package:duct_area_app/!!%20data/themes/color/app_colors.dart';
import 'package:duct_area_app/duct%20sizer/duct_sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../!! data/constant/ads_manager.dart';
import '../../../!! data/themes/style/text_style.dart';

import '../1- duct items/duct_items_view.dart';
import '../2- data tables/data_table.dart';
import '../4- material settings/material_settings_view.dart';
import '../3- settings/settings_view.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  List items = [
    'Duct Sizer',
    'Ducts Items Selection',
    'Saved Projects',
    'Units Settings',
    'Materials Settings',
  ];
  List<StatelessWidget> pages = [
    DuctSizer(title: 'Duct Sizer'),
    DuctItemsView(),
    DataTableView(),
    SettingsView(),
    MaterialSettingsView(),
  ];

  List<IconData> iconsData = [
    FontAwesomeIcons.airbnb,
    FontAwesomeIcons.unity,
    FontAwesomeIcons.buildingColumns,
    Icons.settings,
    Icons.settings
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerNavigationSideBar(),
        appBar: AppBarA(text: 'Duct Designer'),
        body: Container(
          color: AppColors.backgroundColor,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome'),
              Text('Guest !',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 15),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 20,
                    ),
                    itemCount: items.length,
                    itemBuilder: ((context, index) =>
                        _buildImageCard(index, context))),
              ),
              admobBanner,
            ],
          ),
        ));
  }

  Widget _buildImageCard(int index, context) {
    return GestureDetector(
      onTap: () async {
        var result = await Connectivity().checkConnectivity();
        if (result.name == 'none') {
          showCupertinoDialog(
              context: context,
              builder: (BuildContext context) => CupertinoAlertDialog(
                    title: Text('No Internet', style: TextStyles.messageHeader),
                    content: Text('Please connect to internet',
                        style: TextStyles.messageBody),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('OK', style: TextStyles.messageConfirm))
                    ],
                  ));
        } else {
          Get.to(() => pages[index]);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(items[index],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Icon(
                iconsData[index],
                size: 40,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

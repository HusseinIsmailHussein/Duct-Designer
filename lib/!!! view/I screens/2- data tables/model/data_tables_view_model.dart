//import 'package:duct_area_app/!!!%20view/II%20widgets/dialogs/dialog_update.dart';
import 'package:duct_area_app/!%20core/model/page_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../II widgets/dialogs/dialog_about.dart';

class DataTableViewModel extends GetxController {
  int _navigationValue = 0;
  Widget? _currentScreen;
  int get navigationValue => _navigationValue;
  Widget? get currentScreen => _currentScreen;

  @override
  void onInit() async {
    await getStatus();
  }

  getStatus() async {
    final newVersion = NewVersionPlus(androidId: 'com.blueprint.duct_area_app');

    // Future.delayed(Duration(seconds: 5)).then((value) {
    //   newVersion.showAlertIfNecessary(context: Get.context!);
    // });

    final status = await newVersion.getVersionStatus();

    if (status != null) {
      if (status.canUpdate) {
        newVersion.showUpdateDialog(
          context: Get.context!,
          versionStatus: status,
          dialogTitle: 'Update Available',
          updateButtonText: '',
          dismissButtonText: 'Update',
          dialogText: 'a new update is available',
          dismissAction: () async {
            String url =
                'https://play.google.com/store/apps/details?id=com.blueprint.duct_area_app';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          allowDismissal: true,
        );
      }
    }
  }

  void updateView(List<PageModel> pages, int index) {
    _currentScreen = pages[index].page;
    _navigationValue = index;
    update();
  }
}

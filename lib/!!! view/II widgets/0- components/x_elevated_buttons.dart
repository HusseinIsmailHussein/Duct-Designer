import 'package:duct_area_app/!!!%20view/II%20widgets/0-%20components/elevated_button_r.dart';
import 'package:duct_area_app/!!%20data/themes/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../!! data/constant/ads_manager.dart';
import '../../../!!! controllers/item_controller.dart';
import '../../../!!! controllers/projects_controller.dart';
import '../../../!!! controllers/setting_view_model.dart';
import '../../I screens/2- data tables/data_table.dart';
import '../../I screens/4- material settings/model/material_settings_controller.dart';

class ElevatedButtonCancelLink extends StatelessWidget {
  const ElevatedButtonCancelLink({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButtonRoot(
      onPressed: () => Get.back(),
      text: 'Cancel',
      backgroundColor: AppColors.backgroundColor,
      textColor: AppColors.primaryColor,
    );
  }
}

class ElevatedButtonSaveSettings extends StatelessWidget {
  ElevatedButtonSaveSettings({super.key});

  SettingsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ElevatedButtonRoot(
      onPressed: () {
        controller.saveSettings();
        Get.back();
        Get.snackbar('Saved', 'Selected units settings have been saved');
      },
      text: 'Save Settings',
    );
  }
}

class ElevatedButtonSaveMaterial extends StatelessWidget {
  ElevatedButtonSaveMaterial({super.key});

  MaterialSettingsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ElevatedButtonRoot(
      onPressed: () {
        controller.saveMaterialSetting();
        Get.back();
        Get.snackbar('Save Material', 'Material Data has been saved');
      },
      text: 'Save Material',
    );
  }
}

class ElevatedButtonSaveItem extends StatelessWidget {
  ElevatedButtonSaveItem({super.key});

  ProjectsController projectsController = Get.find();
  ItemController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ElevatedButtonRoot(
      onPressed: () {
        if (projectsController.selectedProject == null ||
            projectsController.selectedSystem == null) {
          Get.snackbar('Error', 'Please select project and unit to save');
        } else {
          if (projectsController.selectedItem == null) {
            projectsController.addItem(controller.selectedItem);
          } else {
            projectsController.updateDBItem(controller.selectedItem);
          }

          Get.back();

          // AbsManager().showInterAdb(DataTableView(page: 2));
          Get.to(() => DataTableView(page: 2));
        }
      },
      text: 'Save Item',
    );
  }
}

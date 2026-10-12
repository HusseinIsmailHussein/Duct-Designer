import 'package:duct_area_app/!!!%20controllers/item_controller.dart';
import 'package:duct_area_app/!!!%20view/I%20screens/2-%20data%20tables/model/data_tables_view_model.dart';
import 'package:duct_area_app/!!!%20view/I%20screens/2-%20data%20tables/data_table.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/dialogs/dialog_add_edit_system.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/dialogs/projects.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/dropdown%20button/dropdown_Button_projects.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/dropdown%20button/dropdown_Button_systems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../!!! controllers/projects_controller.dart';
import '../../I screens/1- duct items/db_views.dart';

class DialogAddItem {
  ProjectsController controller = Get.find();
  ItemController itemController = Get.find();
  DataTableViewModel viewController = Get.find();

  DialogAddItem(BuildContext context) {
    Get.defaultDialog(
      title: 'Add Item',
      backgroundColor: Colors.amberAccent,
      content: GetBuilder<ProjectsController>(builder: (controller) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButtonProjects(),
                TextButton(
                    onPressed: () {
                      controller.selectedProject = null;
                      DialogAddEditProject(context);
                    },
                    child: const Text('Create New Project'))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButtonSystems(),
                TextButton(
                    onPressed: () {
                      controller.selectedSystem = null;
                      if (controller.selectedProject == null) {
                        const AlertDialog(
                            content: Text('Please select project'));
                      } else {
                        DialogAddEditSystem(context);
                      }
                    },
                    child: const Text('Create New Unit'))
              ],
            ),
          ],
        );
      }),
      textConfirm: 'Save',
      onConfirm: () {
        if (controller.selectedProject == null ||
            controller.selectedSystem == null) {
          Get.snackbar('Error', 'Please select project and unit to save');
        } else {
          itemController.selectedItem.id = controller.selectedItem?.id;
          controller.selectedItem = itemController.selectedItem;
          controller.selectedItem!.projectId = controller.selectedProject!.id!;
          controller.selectedItem!.systemId = controller.selectedSystem!.id!;
          controller.addItem(controller.selectedItem!);
          Get.back();
          Get.back();
          Get.back();
          Future.delayed(Duration(milliseconds: 500))
              .then((value) => Get.to(DataTableView()));
          viewController.updateView(dataTableViewPages, 2);
        }
      },
    );
  }
}

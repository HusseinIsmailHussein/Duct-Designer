import 'package:duct_area_app/!!!%20controllers/projects_controller.dart';
import 'package:duct_area_app/!%20core/model/system_model.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/dialogs/dialog_add_edit_system.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/action%20cards/action_card_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionCardSystems extends StatelessWidget {
  ActionCardSystems({super.key});
  final ProjectsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    System? system = controller.selectedSystem;
    bool isNotBlank = system != null;

    return ActionCardCustom(
      isNotBlank: isNotBlank,
      color: Colors.white,
      summary: '',
      name: 'Name',
      type: 'Unit',
      addAction: () {
        if (controller.selectedProject == null) {
          Get.snackbar('No Selected Project ', 'Please, select project first');
        } else {
          controller.selectedSystem = null;
          DialogAddEditSystem(context);
        }
      },
      editAction: () => DialogAddEditSystem(context),
      copyAction: () => controller.copySystem(),
      deleteAction: () => controller.deleteSystem(),
    );
  }
}

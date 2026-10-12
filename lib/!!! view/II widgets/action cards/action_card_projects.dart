import 'package:duct_area_app/!!!%20controllers/projects_controller.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/action%20cards/action_card_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../! core/model/project_model.dart';
import '../dialogs/projects.dart';

class ActionCardProjects extends StatelessWidget {
  ActionCardProjects({super.key});
  final ProjectsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Project? project = controller.selectedProject;
    bool isNotBlank = project != null;

    return ActionCardCustom(
      isNotBlank: isNotBlank,
      color: Colors.white,
      summary: '',
      name: 'Name',
      type: 'Project',
      addAction: () {
        controller.selectedProject = null;
        DialogAddEditProject(context);
      },
      editAction: () => DialogAddEditProject(context),
      copyAction: () => controller.copyProject(),
      deleteAction: () => controller.deleteProject(),
    );
  }
}

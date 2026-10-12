import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../!!! controllers/projects_controller.dart';
import '../dialogs/dialog_add_edit_system.dart';
import '../dialogs/projects.dart';
import '../dropdown button/dropdown_Button_projects.dart';
import '../dropdown button/dropdown_Button_systems.dart';

class ContainerAddItem extends StatelessWidget {
  const ContainerAddItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProjectsController>(builder: (controller) {
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
                      const AlertDialog(content: Text('Please select project'));
                    } else {
                      DialogAddEditSystem(context);
                    }
                  },
                  child: const Text('Create New Unit'))
            ],
          ),
        ],
      );
    });
  }
}

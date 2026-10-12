import 'package:duct_area_app/!!%20data/themes/style/app_styles.dart';
import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../!!! controllers/projects_controller.dart';
import '../../../! core/model/project_model.dart';

class DropdownButtonProjects extends StatelessWidget {
  DropdownButtonProjects({super.key});
  ProjectsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProjectsController>(builder: (controller) {
      Project? project = controller.selectedProject;

      return SizedBox(
        width: 175,
        height: 30,
        child: DropdownButtonFormField(
          decoration: AppStyles.dropdownButtonDecoration,
          style: TextStyles.body,
          hint: const Text('Select Project'),
          items: controller.projectsList.map(buildMenuItem).toList(),
          value: project?.id.toString(),
          onChanged: (value) {
            controller.selectedProject = controller.getProjectFromID(int.parse(
                value ?? controller.projectsList.first.id.toString()));
          },
        ),
      );
    });
  }

  DropdownMenuItem<String> buildMenuItem(Project project) {
    return DropdownMenuItem(
      value: project.id.toString(),
      child: Text(
          '${controller.projectsList.indexOf(project) + 1}: ${project.name} (${project.numberOfUnits})'),
    );
  }
}

import 'package:duct_area_app/!!!%20controllers/projects_controller.dart';
import 'package:duct_area_app/!!%20data/themes/color/app_colors.dart';
import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../! core/model/project_model.dart';
import '../../../! core/model/system_model.dart';
import '../../../!! data/themes/style/app_styles.dart';

class DropdownButtonSystems extends StatelessWidget {
  DropdownButtonSystems({super.key});
  ProjectsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProjectsController>(builder: (controller) {
      Project? project = controller.selectedProject;
      System? system = controller.selectedSystem;
      return SizedBox(
        width: 175,
        height: 30,
        child: project == null
            ? Container(
                decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.primaryColor)),
              )
            : DropdownButtonFormField(
                decoration: AppStyles.dropdownButtonDecoration,
                style: TextStyles.body,
                hint: Text(
                  project.systems.length == 0 ? 'Add Unit' : 'Select Unit',
                  style: TextStyles.hint,
                ),
                items: project.systems.map(buildMenuItem).toList(),
                value: system?.id.toString(),
                onChanged: (value) {
                  controller.selectedSystem = controller.getSystemFromID(
                      int.parse(value ?? project.systems.first.id.toString()),
                      project);
                },
              ),
      );
    });
  }

  DropdownMenuItem<String> buildMenuItem(System system) {
    return DropdownMenuItem(
      value: system.id.toString(),
      child: Text(
          '${controller.selectedProject!.systems.indexOf(system) + 1}: ${system.name} (${system.numberOfItems})'),
    );
  }
}

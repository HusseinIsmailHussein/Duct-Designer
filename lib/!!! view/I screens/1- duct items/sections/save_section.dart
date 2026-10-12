import 'package:duct_area_app/!!!%20view/II%20widgets/0-%20sections/section_a.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../!! data/themes/style/app_styles.dart';
import '../../../../!!! controllers/item_controller.dart';
import '../../../../!!! controllers/projects_controller.dart';
import '../../../../!! data/themes/style/text_style.dart';
import '../../../II widgets/0- components/x_elevated_buttons.dart';
import '../../../II widgets/dialogs/dialog_add_edit_system.dart';
import '../../../II widgets/dialogs/projects.dart';
import '../../../II widgets/dropdown button/dropdown_Button_projects.dart';
import '../../../II widgets/dropdown button/dropdown_Button_systems.dart';

Widget saveSection(BuildContext context, ItemController controller) {
  ProjectsController projectsController = Get.find();

  return SectionA(
    headline: 'Save Item',
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Number of items :', style: TextStyles.bodyBold),
            const Expanded(child: SizedBox()),
            Container(
              width: 50,
              height: 30,
              child: TextFormField(
                  style: TextStyles.body,
                  keyboardType: TextInputType.number,
                  decoration: AppStyles.textFormFieldDecorationDimensions,
                  textAlign: TextAlign.center,
                  initialValue: controller.selectedItem.quantity.toString(),
                  onChanged: (value) {
                    controller.selectedItem.quantity = int.tryParse(value) ?? 1;
                  }),
            ),
            const SizedBox(width: 10),
          ],
        ),
        Row(
          children: [
            Text('Selected Project', style: TextStyles.bodyBold),
            const Expanded(child: SizedBox()),
            DropdownButtonProjects(),
            IconButton(
              style: const ButtonStyle(),
              onPressed: () {
                projectsController.selectedProject = null;
                DialogAddEditProject(context);
              },
              icon: const Icon(
                Icons.add,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        Row(
          children: [
            Text('Selected Unit', style: TextStyles.bodyBold),
            const Expanded(child: SizedBox()),
            DropdownButtonSystems(),
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.blue,
              ),
              onPressed: () {
                if (projectsController.selectedProject == null) {
                  const AlertDialog(
                    content: Text('Please select Project'),
                  );
                } else {
                  projectsController.selectedSystem = null;
                  DialogAddEditSystem(context);
                }
              },
            ),
            const SizedBox(width: 10),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
              width: Get.width / 2 - 30, child: ElevatedButtonCancelLink()),
          SizedBox(
            width: Get.width / 2 - 30,
            child: ElevatedButtonSaveItem(),
          ),
        ])
      ],
    ),
  );
}

import 'package:duct_area_app/!!!%20controllers/item_controller.dart';
import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../!!! controllers/projects_controller.dart';
import '../../../! core/model/project_model.dart';

class DialogAddEditProject {
  ProjectsController controller = Get.find();
  ItemController itemController = Get.find();

  DialogAddEditProject(BuildContext context) {
    Project? project = controller.selectedProject;

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String enteredName = '';
    String name = project?.name ?? '';

    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            project == null ? 'Add Project' : 'Update Project',
            style: TextStyles.messageHeader,
          ),
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 35,
                  width: 60,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Name:',
                    style: TextStyles.messageBody,
                  )),
              Container(
                height: 35,
                width: 150,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                alignment: Alignment.centerLeft,
                child: CupertinoTextField(
                  controller: TextEditingController(text: name),
                  onChanged: (value) {
                    enteredName = value;
                  },
                  decoration: BoxDecoration(color: Colors.transparent),
                  placeholder: 'Add Project',
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  style: TextStyles.messageBody,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
                child: Text(
                  'Cancel',
                  style: TextStyles.messageCancel,
                ),
                onPressed: () => Get.back()),
            CupertinoDialogAction(
              child: Text(
                project == null ? 'Add' : 'Change',
                style: TextStyles.messageConfirm,
              ),
              onPressed: () async {
                formKey.currentState?.save();
                if (enteredName == '') {
                  enteredName = project?.name ?? 'New Project';
                }
                if (project == null) {
                  await controller.addProject(enteredName);
                } else {
                  project.name = enteredName;
                  controller.updateDBProject(project);
                }
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}

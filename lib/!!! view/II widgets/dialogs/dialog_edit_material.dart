import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:flutter/cupertino.dart'; // import Cupertino package
import 'package:get/get.dart';

import '../../../!!! controllers/projects_controller.dart';
import '../../../! core/model/selected_settings_model.dart';
import '../../../! core/model/units/dimensions_model.dart';
import '../../../! core/model/units/material.dart';
import '../../I screens/4- material settings/model/material_settings_controller.dart';

class DialogEditMaterial {
  MaterialSettingsController controller = Get.find();
  MaterialDataModel material;
  ProjectsController projectController = Get.find();

  DialogEditMaterial({required this.material}) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    SelectedSettingsModel settings = projectController.selectedSettings;
    double enteredValue =
        fromUnit(settings.area, toUnit(settings.weight, material.density));

    showCupertinoDialog(
      context: Get.overlayContext!,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Change Material Weight/Area',
              style: TextStyles.messageHeader),
          content: Column(
            children: [
              Text('Material:  ${material.material}',
                  style: TextStyles.messageBody),
              Text(
                  'Sheet:  ${toUnit(settings.thickness, material.thickness).toPrecision(2)} ${settings.thickness.name}',
                  style: TextStyles.messageBody),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: CupertinoTextField(
                      key: formKey,
                      style: TextStyles.messageBody,
                      onChanged: (value) {
                        enteredValue = double.tryParse(value) ??
                            fromUnit(settings.area,
                                toUnit(settings.weight, material.density));
                      },
                      controller: TextEditingController(
                          text: fromUnit(settings.area,
                                  toUnit(settings.weight, material.density))
                              .toPrecision(2)
                              .toString()),
                      decoration: BoxDecoration(
                        border: Border.all(color: CupertinoColors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      placeholder: 'Add material density',
                    ),
                  ),
                  SizedBox(
                      width: 100,
                      child: Text(
                          '${settings.weight.name}/${settings.area.name}',
                          style: TextStyles.messageBody))
                ],
              ),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              child: Text(
                'Cancel',
                style: TextStyles.messageCancel,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            CupertinoDialogAction(
              child: Text('Change', style: TextStyles.messageConfirm),
              onPressed: () {
                formKey.currentState?.save();
                material.density = toUnit(
                    settings.area, fromUnit(settings.weight, enteredValue));
                controller.updateMaterial(material);
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}

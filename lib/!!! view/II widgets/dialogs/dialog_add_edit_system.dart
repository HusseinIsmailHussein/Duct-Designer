import 'package:duct_area_app/!%20core/model/system_model.dart';
import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../!!! controllers/projects_controller.dart';

class DialogAddEditSystem {
  ProjectsController controller = Get.find();

  DialogAddEditSystem(BuildContext context) {
    System? system = controller.selectedSystem;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String enteredName = '';
    String name = system?.name ?? '';
    int qty = 1;

    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(
          system == null ? 'Add Unit Name' : 'Update Unit Name',
          style: TextStyles.messageHeader,
        ),
        content: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 30,
                  alignment: Alignment.centerLeft,
                  child: Text('Name', style: TextStyles.messageBody),
                ),
                Container(
                  width: 150,
                  height: 30,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: CupertinoTextField(
                    key: formKey,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    onChanged: (value) {
                      enteredName = value;
                    },
                    controller: TextEditingController(text: name),
                    placeholder: 'Add Unit',
                    style: TextStyles.messageBody,
                    decoration: BoxDecoration(color: Colors.transparent),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Container(
                  width: 70,
                  height: 30,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Quantity',
                    style: TextStyles.messageBody,
                  ),
                ),
                Container(
                  padding: EdgeInsets.zero,
                  width: 50,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  alignment: Alignment.centerLeft,
                  child: CupertinoTextField(
                    style: TextStyles.messageBody,
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(color: Colors.transparent),
                    textAlign: TextAlign.center,
                    controller: TextEditingController(
                        text: controller.selectedSystem?.quantity.toString() ??
                            '1'),
                    onChanged: (value) {
                      qty = int.tryParse(value) ?? 1;
                    },
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              'Cancel',
              style: TextStyles.messageCancel,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text(
              system == null ? 'Add' : 'Change',
              style: TextStyles.messageConfirm,
            ),
            onPressed: () async {
              formKey.currentState?.save();
              if (enteredName == '') {
                enteredName = system?.name ?? 'New Unit';
              }

              if (system == null) {
                await controller.addSystem(enteredName, qty);
              } else {
                system.name = enteredName;
                system.quantity = qty;
                controller.updateDBSystem(system);
              }
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

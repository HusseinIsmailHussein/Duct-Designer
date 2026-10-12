import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../!! data/constant/constance.dart';
import '../../../!! data/themes/style/app_styles.dart';
import '../../I screens/4- material settings/model/material_settings_controller.dart';

class DropdownMaterial extends StatelessWidget {
  DropdownMaterial({super.key});
  MaterialSettingsController controller = Get.find();

  List<String> materials = [Materials.galvanizedSteel, Materials.aluminum];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 30,
      child: GetBuilder<MaterialSettingsController>(builder: (controller) {
        return DropdownButtonFormField(
          style: TextStyles.body,
          decoration: AppStyles.dropdownButtonDecoration,
          alignment: AlignmentDirectional.center,
          dropdownColor: Colors.blue,
          items: materials.map(buildMenuItem).toList(),
          value: controller.material,
          onChanged: (value) {
            controller.material = value ?? materials[0];
          },
        );
      }),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String material) {
    return DropdownMenuItem(
      value: material,
      child: Text(
        material,
        style: TextStyles.body,
      ),
    );
  }
}

import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../!! data/constant/constance.dart';
import '../../../!! data/themes/style/app_styles.dart';
import '../../I screens/4- material settings/model/material_settings_controller.dart';

class DropdownThicknessUnits extends StatelessWidget {
  DropdownThicknessUnits({super.key});
  MaterialSettingsController controller = Get.find();

  List<String> thicknessUnits = [DimensionName.metric, DimensionName.us];

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
          items: thicknessUnits.map(buildMenuItem).toList(),
          value: controller.thicknessUnit,
          onChanged: (value) {
            controller.thicknessUnit = value ?? thicknessUnits[0];
          },
        );
      }),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String thicknessUnit) {
    return DropdownMenuItem(
      value: thicknessUnit,
      child: Text(
        thicknessUnit,
        style: TextStyles.body,
      ),
    );
  }
}

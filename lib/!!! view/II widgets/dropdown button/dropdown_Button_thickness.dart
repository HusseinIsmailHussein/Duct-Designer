import 'package:duct_area_app/!!!%20controllers/item_controller.dart';
import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../! core/model/units/material.dart';
import '../../../!! data/constant/constance.dart';
import '../../../!! data/themes/style/app_styles.dart';

class DropdownButtonThickness extends StatelessWidget {
  DropdownButtonThickness({super.key});
  ItemController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 30,
      child: DropdownButtonFormField(
        style: TextStyles.body,
        decoration: AppStyles.dropdownButtonDecoration,
        alignment: AlignmentDirectional.center,
        dropdownColor: Colors.amberAccent.shade100,
        items: controller.materialList.map(buildMenuItem).toList(),
        value: controller.selectedMaterial?.id.toString(),
        onChanged: (value) {
          controller.selectedMaterial = controller.materialList
              .firstWhere((element) => element.id == int.tryParse(value ?? ''));
          controller.calculateWeight();
        },
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(MaterialDataModel material) {
    return DropdownMenuItem(
      value: material.id.toString(),
      child: Text(
        material.unit == DimensionName.metric
            ? '${material.thickness} ${material.unit}'
            : ' ${material.gauge}',
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}

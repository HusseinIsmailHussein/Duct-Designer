import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/buttons/button_type_a.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../II widgets/data tables/data_table_mthickness.dart';
import '../model/material_settings_controller.dart';

class MaterialsTableView extends StatelessWidget {
  MaterialsTableView({required this.material, required this.units, super.key});
  MaterialSettingsController controller = Get.find();
  String material;
  String units;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          '$material - $units',
          style: TextStyles.appbar,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DataTableThickness(units: units),
              ButtonTypeA(
                  text: 'Reset Material data',
                  onPressed: () => controller.resetMaterialSetting()),
              ButtonTypeA(
                  text: 'Save Settings',
                  onPressed: () => controller.saveMaterialSetting()),
            ],
          ),
        ),
      ),
    );
  }
}

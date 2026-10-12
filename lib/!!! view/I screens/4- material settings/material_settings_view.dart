import 'package:duct_area_app/!!!%20view/II%20widgets/buttons/button_cancel.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/buttons/button_confirm.dart';
import 'package:duct_area_app/!!%20data/themes/color/app_colors.dart';
import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../!! data/constant/ads_manager.dart';
import '../../II widgets/0- appbar/appbar_a.dart';
import '../../II widgets/0- components/x_elevated_buttons.dart';
import '../../II widgets/buttons/button_type_a.dart';
import '../../II widgets/data tables/data_table_material.dart';
import '../../II widgets/data tables/data_table_mthickness.dart';
import '../../II widgets/dropdown button/dropdown_Button_material.dart';
import '../../II widgets/dropdown button/dropdown_Button_thickness_units.dart';
import 'model/material_settings_controller.dart';

class MaterialSettingsView extends StatelessWidget {
  MaterialSettingsView({super.key});

  MaterialSettingsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarA(
        text: 'Material Settings',
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: GetBuilder<MaterialSettingsController>(
                      builder: (controller) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Row(
                          children: [
                            DataTableThickness(units: 'mm'),
                            DataTableMaterials(
                              units: 'mm',
                              material: 'Galvanized Steel',
                            ),
                            DataTableMaterials(
                              units: 'mm',
                              material: 'Aluminum',
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            DataTableThickness(units: 'gauge'),
                            DataTableMaterials(
                              units: 'gauge',
                              material: 'Galvanized Steel',
                            ),
                            DataTableMaterials(
                              units: 'gauge',
                              material: 'Aluminum',
                            )
                          ],
                        ),
                        SizedBox(height: 5),
                        TextButton.icon(
                            onPressed: () => controller.resetMaterialSetting(),
                            icon: Icon(Icons.restore),
                            label: Text('Reset Material data')),
                        SizedBox(height: 20),
                      ],
                    );
                  })),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: Get.width / 2 - 20, child: ElevatedButtonCancelLink()),
              SizedBox(
                  width: Get.width / 2 - 20,
                  child: ElevatedButtonSaveMaterial())
            ],
          ),
          SizedBox(
            height: 10,
          ),
          admobBanner,
        ],
      ),
    );
  }
}

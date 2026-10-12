import 'package:duct_area_app/!!!%20controllers/setting_view_model.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/0-%20appbar/appbar_a.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/list%20view/list_view_units_selector.dart';
import 'package:duct_area_app/!!%20data/themes/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../!! data/constant/ads_manager.dart';
import '../../../!! data/constant/dimensions_list.dart';
import '../../II widgets/0- components/x_elevated_buttons.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarA(
          text: 'Units Settings',
        ),
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: SingleChildScrollView(
                child: GetBuilder<SettingsController>(builder: (controller) {
                  return Column(children: [
                    SizedBox(height: 10),
                    ListViewUnitsSelector(
                        text: 'Length',
                        list: listLengthModel,
                        onTap: (index) => controller.updateLength(index),
                        selected: listLengthModel
                            .indexOf(controller.selectedSettings.length)),
                    const SizedBox(height: 20),
                    ListViewUnitsSelector(
                        text: 'Area',
                        list: listAreaModel,
                        onTap: (index) => controller.updateArea(index),
                        selected: listAreaModel
                            .indexOf(controller.selectedSettings.area)),
                    const SizedBox(height: 20),
                    ListViewUnitsSelector(
                        text: 'Thickness',
                        list: listThicknessModel,
                        onTap: (index) => controller.updateThickness(index),
                        selected: listThicknessModel
                            .indexOf(controller.selectedSettings.thickness)),
                    const SizedBox(height: 20),
                    ListViewUnitsSelector(
                        text: 'Weight',
                        list: listWeightModel,
                        onTap: (index) => controller.updateWeight(index),
                        selected: listWeightModel
                            .indexOf(controller.selectedSettings.weight)),
                    const SizedBox(height: 20),
                    ListViewUnitsSelector(
                        text: 'Material',
                        list: listMaterialModel,
                        onTap: (index) => controller.updateMaterial(index),
                        selected: listMaterialModel
                            .indexOf(controller.selectedSettings.material)),
                    SizedBox(height: 10)
                  ]);
                }),
              ),
            ),
            Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: Get.width / 2 - 20,
                    child: ElevatedButtonCancelLink()),
                SizedBox(
                    width: Get.width / 2 - 20,
                    child: ElevatedButtonSaveSettings())
              ],
            ),
            SizedBox(height: 10),
            admobBanner,
          ],
        ));
  }
}

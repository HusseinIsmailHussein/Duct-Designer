import 'package:duct_area_app/!!!%20controllers/item_controller.dart';
import 'package:duct_area_app/!!!%20controllers/projects_controller.dart';
import 'package:duct_area_app/!!!%20controllers/setting_view_model.dart';
import 'package:duct_area_app/!!%20data/themes/color/app_colors.dart';
import 'package:duct_area_app/!!!%20view/I%20screens/1-%20duct%20items/sections/Error_section.dart';
import 'package:duct_area_app/!!!%20view/I%20screens/1-%20duct%20items/sections/dimensions_section.dart';
import 'package:duct_area_app/!!!%20view/I%20screens/1-%20duct%20items/sections/results_section.dart';
import 'package:duct_area_app/!!!%20view/I%20screens/1-%20duct%20items/sections/save_section.dart';
import 'package:duct_area_app/!!!%20view/I%20screens/1-%20duct%20items/sections/sheet_metal_data_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../!! data/constant/ads_manager.dart';
import '../../II widgets/0- appbar/appbar_a.dart';

class DuctItemsDetails extends StatefulWidget {
  DuctItemsDetails({Key? key}) : super(key: key);

  @override
  State<DuctItemsDetails> createState() => _DuctItemsDetailsState();
}

class _DuctItemsDetailsState extends State<DuctItemsDetails> {
  ProjectsController projectsController = Get.find();

  SettingsController settingsController = Get.find();

  ItemController controller = Get.find();

  @override
  void initState() {
    print('Item controller added');
    controller.errors = [];
    controller.selectedItem.totalArea =
        projectsController.selectedItem?.totalArea ?? 0.0;
    controller.selectedItem.totalWeight =
        projectsController.selectedItem?.totalWeight ?? 0.0;
    controller.selectedItem.quantity =
        projectsController.selectedItem?.quantity ?? 1;

    if (projectsController.selectedItem == null) {
      controller.selectedItem.variables = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    } else {
      controller.selectedItem.variables =
          projectsController.selectedItem!.variables;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemController>(builder: (controller) {
      return Scaffold(
        appBar: AppBarA(
          text: controller.selectedDuct?.name ?? '',
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          color: AppColors.backgroundColor,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      dimensionsSection(controller),
                      const SizedBox(height: 10),
                      errorSection(controller),
                      resultsSection(controller),
                      const SizedBox(height: 10),
                      SheetMetalDataSection(),
                      const SizedBox(height: 10),
                      saveSection(context, controller),
                    ],
                  ),
                ),
              ),
              admobBanner,
            ],
          ),
        ),
      );
    });
  }
}

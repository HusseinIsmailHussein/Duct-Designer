import 'dart:math';

import 'package:duct_area_app/!!!%20controllers/item_controller.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/0-%20sections/section_a.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../!!! controllers/projects_controller.dart';
import '../../../../!!! controllers/setting_view_model.dart';
import '../../../../! core/model/selected_settings_model.dart';
import '../../../../! core/model/units/dimensions_model.dart';
import '../../../II widgets/text forms/form_dimensions.dart';

Widget dimensionsSection(ItemController controller) {
  ProjectsController projectsController = Get.find();
  SettingsController settingsController = Get.find();

  SelectedSettingsModel settings = settingsController.selectedSettings;
  int count = controller.selectedDuct?.variables.length ?? 1;
  double heights = max(count * 35 + 10, Get.width * .4);

  return SectionA(
    headline: 'Dimensions',
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            'assets/images/ducts/${controller.selectedDuct?.id}-${controller.selectedDuct?.name}-2.PNG',
            width: Get.width * .9,
          ),
        ),
        Container(
          height: heights,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width * .4,
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: count,
                    itemBuilder: ((context, index) => FormDimensions(
                          unit: controller.selectedDuct!.variables
                                      .elementAt(index)
                                      .category ==
                                  DimensionsCategories.length
                              ? settings.length.name
                              : 'deg',
                          text: controller.selectedDuct?.variables
                                  .elementAt(index)
                                  .name ??
                              '0',
                          hint: '',
                          onChanged: (value) {
                            controller.selectedItem.variables[index] =
                                controller.selectedDuct!.variables
                                            .elementAt(index)
                                            .category ==
                                        DimensionsCategories.length
                                    ? fromUnit(settings.length,
                                        double.tryParse(value) ?? 0)
                                    : double.tryParse(value) ?? 0;
                            controller.calculate();
                          },
                          initialValue: projectsController.selectedItem == null
                              ? ''
                              : toUnit(
                                      settings.length,
                                      projectsController
                                          .selectedItem!.variables[index])
                                  .toPrecision(3)
                                  .toString(),
                          validator: () {},
                        ))),
              ),
              Image.asset(
                'assets/images/ducts/${controller.selectedDuct?.id}-${controller.selectedDuct?.name}.PNG',
                width: Get.width * .4,
              )
            ],
          ),
        ),
      ],
    ),
  );
}

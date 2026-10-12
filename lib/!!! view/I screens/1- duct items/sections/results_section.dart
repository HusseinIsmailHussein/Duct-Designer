import 'package:duct_area_app/!!!%20view/II%20widgets/0-%20sections/section_a.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../!!! controllers/item_controller.dart';
import '../../../../!!! controllers/setting_view_model.dart';
import '../../../../! core/model/selected_settings_model.dart';
import '../../../../! core/model/units/dimensions_model.dart';
import '../../../../!! data/themes/style/text_style.dart';

Widget resultsSection(ItemController controller) {
  SettingsController settingsController = Get.find();

  SelectedSettingsModel settings = settingsController.selectedSettings;

  return SectionA(
    headline: 'Results',
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Duct Area:', style: TextStyles.bodyBold),
            const Expanded(child: SizedBox()),
            Text(
              '${toUnit(settings.area, controller.selectedItem.totalArea).toPrecision(1)} ${settings.area.name}',
              textAlign: TextAlign.center,
              style: TextStyles.bodyBold,
            ),
            const SizedBox(width: 10)
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Duct Weight:', style: TextStyles.bodyBold),
            const Expanded(child: SizedBox()),
            Text(
              '${toUnit(settings.weight, controller.selectedItem.totalWeight).toPrecision(1)} ${settings.weight.name}',
              textAlign: TextAlign.center,
              style: TextStyles.bodyBold,
            ),
            const SizedBox(width: 10)
          ],
        ),
        //Text('Variables ${controller.selectedItem.variables}'),
      ],
    ),
  );
}

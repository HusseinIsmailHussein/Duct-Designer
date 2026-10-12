import 'package:duct_area_app/!!!%20view/II%20widgets/0-%20sections/section_a.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../!!! controllers/setting_view_model.dart';
import '../../../../!! data/themes/style/text_style.dart';
import '../../../II widgets/dropdown button/dropdown_Button_thickness.dart';

Widget SheetMetalDataSection() {
  SettingsController settingsController = Get.find();

  return SectionA(
    headline: 'Sheet Metal Data',
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sheet Metal Material', style: TextStyles.body),
            const Expanded(child: SizedBox()),
            Text(settingsController.selectedSettings.material.name,
                style: TextStyles.body),
            const SizedBox(width: 10)
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Text('Sheet Metal Thickness', style: TextStyles.body),
            const Expanded(child: SizedBox()),
            DropdownButtonThickness(),
            const SizedBox(width: 10)
          ],
        ),
      ],
    ),
  );
}

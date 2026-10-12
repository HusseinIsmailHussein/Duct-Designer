import 'package:duct_area_app/!!!%20view/II%20widgets/0-%20sections/section_a.dart';
import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:flutter/material.dart';

import '../../../../!!! controllers/item_controller.dart';

Widget errorSection(ItemController controller) {
  return controller.errors.length == 0
      ? Container()
      : Column(
          children: [
            SectionA(
              headline: 'Errors',
              body: Container(
                height: controller.errors.length * 20,
                child: ListView.builder(
                  itemCount: controller.errors.length,
                  itemBuilder: (context, index) => Container(
                    height: 20,
                    child: Text(
                      '${controller.errors[index]}',
                      style: TextStyles.error,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        );
}

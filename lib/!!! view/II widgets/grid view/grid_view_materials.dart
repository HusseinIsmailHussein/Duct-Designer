import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../!! data/constant/constance.dart';
import '../../I screens/4- material settings/sub view/material_table_view.dart';

class GridViewMaterials extends StatelessWidget {
  GridViewMaterials({super.key});

  List<List<String>> list = [
    [Materials.galvanizedSteel, DimensionName.metric],
    [Materials.aluminum, DimensionName.metric],
    [Materials.galvanizedSteel, DimensionName.us],
    [Materials.aluminum, DimensionName.us],
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: GridView.builder(
        itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: ((context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () => Get.to(() => MaterialsTableView(
                      material: list[index][0],
                      units: list[index][1],
                    )),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Card(
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          list[index][0],
                          style: TextStyles.bodyMain,
                        ),
                        Text(
                          list[index][1],
                          style: TextStyles.bodyMain,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

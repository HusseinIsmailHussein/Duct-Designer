import 'package:duct_area_app/!!!%20controllers/item_controller.dart';
import 'package:duct_area_app/!!%20data/themes/color/app_colors.dart';
import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:duct_area_app/!!!%20view/I%20screens/1-%20duct%20items/duct_item_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../!!! controllers/projects_controller.dart';
import '../../../!! data/constant/duct_items_list.dart';
import '../../../! core/model/duct_model.dart';

class GridViewDuctList extends StatelessWidget {
  GridViewDuctList({required this.category, super.key});
  String category;
  ItemController controller = Get.find();
  ProjectsController projectsController = Get.find();

  @override
  Widget build(BuildContext context) {
    List<DuctModel> ducts =
        ductsList.where((element) => element.category == category).toList();

    return Scaffold(
        body: Container(
      color: AppColors.backgroundColor,
      child: GridView.builder(
        padding: EdgeInsets.only(top: 20),
        itemCount: ducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemBuilder: ((context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  projectsController.selectedItem = null;
                  controller.selectedDuct = ducts[index];
                  controller.selectedItem.ductId = controller.selectedDuct!.id;
                  Get.to(DuctItemsDetails());
                },
                child: Container(
                  height: Get.width * .48,
                  width: Get.width * .4,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Image.asset(
                            'assets/images/ducts/${ducts[index].id}-${ducts[index].name}.PNG',
                            fit: BoxFit.cover),
                      ),
                      Text(
                        ducts[index].name,
                        style: TextStyles.bodyBold,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    ));
  }
}

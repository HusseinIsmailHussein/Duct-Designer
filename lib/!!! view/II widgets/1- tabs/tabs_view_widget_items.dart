import 'package:duct_area_app/!!%20data/themes/color/app_colors.dart';
import 'package:duct_area_app/!%20core/model/page_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../I screens/1- duct items/model/duct_items_view_model.dart';

class TabsViewWidgetItems extends StatelessWidget {
  TabsViewWidgetItems({required this.pagesView, super.key});

  List<PageModel> pagesView;

  DuctItemsViewModel controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DuctItemsViewModel>(
        builder: (controller) {
          return Scaffold(
            body: Column(
              children: [
                Container(
                  decoration:
                      const BoxDecoration(color: AppColors.primaryColor),
                  child: tabsWidget(controller),
                ),
                Expanded(
                  child: controller.currentScreen ?? pagesView[0].page,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget tabsWidget(DuctItemsViewModel controller) => SizedBox(
        width: Get.width,
        height: 80,
        child: ListView.builder(
          itemCount: pagesView.length,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: ((context, index) {
            return Container(
              width: Get.width / pagesView.length,
              child: TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(0))),
                onPressed: () => controller.updateView(pagesView, index),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 5),
                    Icon(
                      pagesView[index].iconData.icon,
                      size: 30,
                      color: index == controller.navigationValue
                          ? Colors.amber
                          : Colors.white,
                    ),
                    Text(
                      pagesView[index].name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: index == controller.navigationValue
                            ? Colors.amber
                            : Colors.white,
                      ),
                    ),
                    index == controller.navigationValue
                        ? Container(
                            height: 5,
                            width: Get.width / pagesView.length - 20,
                            color: Colors.amber,
                          )
                        : const SizedBox(
                            height: 5,
                          )
                  ],
                ),
              ),
            );
          }),
        ),
      );
}

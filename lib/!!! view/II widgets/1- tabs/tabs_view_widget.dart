import 'package:duct_area_app/!!%20data/themes/color/app_colors.dart';
import 'package:duct_area_app/!%20core/model/page_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../!! data/constant/ads_manager.dart';
import '../../I screens/2- data tables/model/data_tables_view_model.dart';

class TabsViewWidget extends StatelessWidget {
  TabsViewWidget({required this.pagesView, super.key});

  List<PageModel> pagesView;

  DataTableViewModel controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DataTableViewModel>(
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
                admobBanner,
              ],
            ),
          );
        },
      ),
    );
  }

  Widget tabsWidget(DataTableViewModel controller) => SizedBox(
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
                    SizedBox(
                      height: 7,
                    ),
                    Icon(
                      pagesView[index].iconData.icon,
                      color: index == controller.navigationValue
                          ? Colors.amber
                          : Colors.white,
                    ),
                    Text(
                      pagesView[index].name,
                      style: TextStyle(
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

import 'package:duct_area_app/!!!%20view/I%20screens/1-%20duct%20items/model/duct_items_view_model.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/1-%20tabs/tabs_view_widget_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../!! data/constant/ads_manager.dart';
import '../../II widgets/0- appbar/appbar_b.dart';
import 'db_views.dart';

class DuctItemsView extends StatelessWidget {
  DuctItemsView({super.key});

  DuctItemsViewModel ductsItemsViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    ductsItemsViewModel.updateView(ductTypesPages, 0);
    return Scaffold(
      appBar: AppBarB(
        text: 'Duct Items',
      ),
      body: Column(
        children: [
          Expanded(
              child: TabsViewWidgetItems(
            pagesView: ductTypesPages,
          )),
          admobBanner,
        ],
      ),
    );
  }
}

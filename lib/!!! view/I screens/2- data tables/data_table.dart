import 'package:duct_area_app/!!!%20view/II%20widgets/1-%20tabs/tabs_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../II widgets/0- appbar/appbar_b.dart';
import 'model/data_tables_view_model.dart';
import '../1- duct items/db_views.dart';

class DataTableView extends StatelessWidget {
  final int page;
  DataTableView({super.key, this.page = 0});

  DataTableViewModel controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.updateView(dataTableViewPages, page);
    return Scaffold(
      appBar: AppBarB(text: 'Saved Projects Data'),
      body: GetBuilder<DataTableViewModel>(
        builder: (controller) {
          return Scaffold(
            body: TabsViewWidget(
              pagesView: dataTableViewPages,
            ),
          );
        },
      ),
    );
  }
}

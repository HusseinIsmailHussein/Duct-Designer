import 'package:duct_area_app/!!!%20controllers/projects_controller.dart';
import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/action%20cards/action_card_items.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/data%20tables/data_table_items.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/dropdown%20button/dropdown_Button_projects.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../! core/model/system_model.dart';
import '../../II widgets/dropdown button/dropdown_Button_systems.dart';
import '../../II widgets/scroll view/scroll-view_widget.dart';

class DataTableItemsPage extends StatelessWidget {
  DataTableItemsPage({
    super.key,
  });

  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProjectsController>(
        builder: (controller) {
          System? system = controller.selectedSystem;
          return Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Selected Project: ',
                        style: TextStyles.bodyBold,
                      ),
                      DropdownButtonProjects(),
                    ]),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Selected Unit: ',
                      style: TextStyles.bodyBold,
                    ),
                    DropdownButtonSystems(),
                  ],
                ),
              ),
              Expanded(
                  child: system == null
                      ? Center(
                          child: Text('Please Select Unit',
                              style: TextStyles.bodyBold),
                        )
                      : ScrollViewWidget(child: DataTableItems())),
              ItemsActionsBar()
            ],
          );
        },
      ),
    );
  }
}

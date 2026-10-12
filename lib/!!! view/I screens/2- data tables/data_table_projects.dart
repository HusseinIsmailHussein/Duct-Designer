import 'package:duct_area_app/!!!%20controllers/projects_controller.dart';
import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/data%20tables/data_table_projects.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../II widgets/action cards/action_card_projects.dart';
import '../../II widgets/scroll view/scroll-view_widget.dart';

class DataTableProjectsPage extends StatelessWidget {
  const DataTableProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProjectsController>(
          builder: (controller) => Column(
                children: [
                  Expanded(
                    child: ScrollViewWidget(
                      child: controller.projectsList.isEmpty
                          ? Center(
                              child: Text('PLease add Project',
                                  style: TextStyles.bodyBold))
                          : DataTableProjects(),
                    ),
                  ),
                  ActionCardProjects(),
                ],
              )),
    );
  }
}

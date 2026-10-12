import 'package:duct_area_app/!!!%20controllers/projects_controller.dart';
import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/data%20tables/data_table_systems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../! core/model/project_model.dart';
import '../../II widgets/action cards/action_card_systems.dart';
import '../../II widgets/dropdown button/dropdown_Button_projects.dart';
import '../../II widgets/scroll view/scroll-view_widget.dart';

class DataTableSystemsPage extends StatelessWidget {
  DataTableSystemsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProjectsController>(
        builder: (controller) {
          Project? project = controller.selectedProject;
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
              Expanded(
                  child: project == null
                      ? Center(
                          child: Text('Please Select Project',
                              style: TextStyles.bodyBold),
                        )
                      : ScrollViewWidget(child: DataTableSystems(controller))),
              ActionCardSystems(),
            ],
          );
        },
      ),
    );
  }
}

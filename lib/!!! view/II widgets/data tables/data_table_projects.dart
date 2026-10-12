import 'package:duct_area_app/!!!%20controllers/projects_controller.dart';
import 'package:duct_area_app/!!!%20view/I%20screens/2-%20data%20tables/model/data_tables_view_model.dart';
import 'package:duct_area_app/!%20core/model/selected_settings_model.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/dialogs/projects.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../!! data/themes/style/text_style.dart';
import '../../I screens/1- duct items/db_views.dart';
import '../../../! core/model/project_model.dart';
import '../../../! core/model/units/dimensions_model.dart';
import '../../I screens/2- data tables/data_table.dart';

class DataTableProjects extends StatelessWidget {
  DataTableProjects({super.key});
  ProjectsController controller = Get.find();
  DataTableViewModel dataTableViewModel = Get.find();
  final columns = [
    'index',
    'Project Name',
    '# Units',
    '# Items',
    'Area',
    'Weight',
    'Created Date',
    'Modified Date'
  ];

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 5,
      sortAscending: controller.isAscending,
      sortColumnIndex: controller.sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(context),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map(
        (column) => DataColumn(
          label: Text(column, style: TextStyles.tableHeader),
          onSort: (columnIndex, ascending) {
            List<Project> projects = controller.projectsList;
            if (columnIndex == 0) {
              projects.sort((project1, project2) =>
                  compareString(ascending, project1.id ?? 0, project2.id ?? 0));
            } else if (columnIndex == 1) {
              projects.sort((project1, project2) =>
                  compareString(ascending, project1.name, project2.name));
            } else if (columnIndex == 2) {
              projects.sort((project1, project2) => compareString(
                  ascending, project1.numberOfUnits, project2.numberOfUnits));
            } else if (columnIndex == 3) {
              projects.sort((project1, project2) => compareString(
                  ascending, project1.numberOfItems, project2.numberOfItems));
            } else if (columnIndex == 4) {
              projects.sort((project1, project2) => compareString(
                  ascending, project1.totalArea, project2.totalArea));
            } else if (columnIndex == 5) {
              projects.sort((project1, project2) => compareString(
                  ascending, project1.totalWeight, project2.totalWeight));
            } else if (columnIndex == 6) {
              projects.sort((project1, project2) => compareString(
                  ascending, project1.dateCreated, project2.dateCreated));
            } else if (columnIndex == 7) {
              projects.sort((project1, project2) => compareString(
                  ascending, project1.dateModified, project2.dateModified));
            }

            controller.projectsList = projects;
            controller.sortColumnIndex = columnIndex;
            controller.isAscending = ascending;
          },
        ),
      )
      .toList();

  int compareString(bool ascending, dynamic value1, dynamic value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

  List<DataRow> getRows(BuildContext context) {
    Project? selectedProject = controller.selectedProject;
    List<Project> projects = controller.projectsList;
    SelectedSettingsModel settings = controller.selectedSettings;
    return projects
        .map(
          (project) => DataRow(
            cells: [
              DataCell(Text('${projects.indexOf(project) + 1}',
                  style: TextStyles.tableBody)),
              DataCell(Text(project.name, style: TextStyles.tableBody),
                  showEditIcon: true, onTap: () {
                controller.selectedProject = project;
                DialogAddEditProject(context);
              }),
              DataCell(Center(
                  child: Text('${project.numberOfUnits}',
                      style: TextStyles.tableBody))),
              DataCell(Center(
                  child: Text('${project.numberOfItems}',
                      style: TextStyles.tableBody))),
              DataCell(Center(
                  child: Text(
                      '${toUnit(settings.area, project.totalArea).toPrecision(1)} ${settings.area.name}',
                      style: TextStyles.tableBody))),
              DataCell(Center(
                  child: Text(
                      '${toUnit(settings.weight, project.totalWeight).toPrecision(1)} ${settings.weight.name}',
                      style: TextStyles.tableBody))),
              DataCell(Center(
                  child: Text(
                      DateFormat('yyyy-MM-dd').format(project.dateCreated),
                      style: TextStyles.tableBody))),
              DataCell(Center(
                  child: Text(
                      DateFormat('yyyy-MM-dd').format(project.dateModified),
                      style: TextStyles.tableBody))),
            ],
            onLongPress: () {
              dataTableViewModel.updateView(dataTableViewPages, 1);
              Get.to(() => DataTableView());
              controller.selectedProject = project;
            },
            selected: selectedProject == project,
            onSelectChanged: (isSelected) {
              final isAdding = isSelected != null && isSelected;
              Project? select = controller.selectedProject;
              isAdding ? select = project : select = null;
              controller.selectedProject = select;
            },
          ),
        )
        .toList();
  }
}

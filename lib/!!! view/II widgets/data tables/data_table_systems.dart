import 'package:duct_area_app/!!!%20controllers/projects_controller.dart';
import 'package:duct_area_app/!!!%20view/I%20screens/2-%20data%20tables/model/data_tables_view_model.dart';
import 'package:duct_area_app/!%20core/model/system_model.dart';
import 'package:duct_area_app/!!!%20view/I%20screens/2-%20data%20tables/data_table.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/dialogs/dialog_add_edit_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../!! data/themes/style/text_style.dart';
import '../../I screens/1- duct items/db_views.dart';
import '../../../! core/model/selected_settings_model.dart';
import '../../../! core/model/units/dimensions_model.dart';

class DataTableSystems extends StatelessWidget {
  DataTableSystems(ProjectsController controller, {super.key});
  DataTableViewModel dataTableViewModel = Get.find();
  final columns = [
    'ID',
    'Unit Name',
    'Qty',
    '# Items',
    'Area',
    'Weight',
    'Created Date',
    'Modified Date'
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProjectsController>(builder: (controller) {
      return DataTable(
        columnSpacing: 5,
        sortAscending: controller.isAscending,
        sortColumnIndex: controller.sortColumnIndex,
        columns: getColumns(columns, controller),
        rows: getRows(controller, context),
      );
    });
  }

  List<DataColumn> getColumns(
          List<String> columns, ProjectsController controller) =>
      columns
          .map(
            (column) => DataColumn(
              label: Text(column, style: TextStyles.tableHeader),
              onSort: (columnIndex, ascending) {
                List<System> systems = controller.selectedProject!.systems;
                if (columnIndex == 0) {
                  systems.sort((system1, system2) => compareString(
                      ascending, system1.id ?? 0, system2.id ?? 0));
                } else if (columnIndex == 1) {
                  systems.sort((system1, system2) =>
                      compareString(ascending, system1.name, system2.name));
                } else if (columnIndex == 2) {
                  systems.sort((system1, system2) => compareString(
                      ascending, system1.quantity, system2.quantity));
                } else if (columnIndex == 3) {
                  systems.sort((system1, system2) => compareString(
                      ascending, system1.numberOfItems, system2.numberOfItems));
                } else if (columnIndex == 4) {
                  systems.sort((system1, system2) => compareString(
                      ascending, system1.totalArea, system2.totalArea));
                } else if (columnIndex == 5) {
                  systems.sort((system1, system2) => compareString(
                      ascending, system1.totalWeight, system2.totalWeight));
                } else if (columnIndex == 6) {
                  systems.sort((system1, system2) => compareString(
                      ascending, system1.dateCreated, system2.dateCreated));
                } else if (columnIndex == 7) {
                  systems.sort((system1, system2) => compareString(
                      ascending, system1.dateModified, system2.dateModified));
                }

                controller.selectedProject?.systems = systems;
                controller.sortColumnIndex = columnIndex;
                controller.isAscending = ascending;
              },
            ),
          )
          .toList();

  int compareString(bool ascending, dynamic value1, dynamic value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

  List<DataRow> getRows(ProjectsController controller, BuildContext context) {
    System? selectedSystem = controller.selectedSystem;
    List<System> systems = controller.selectedProject!.systems;
    SelectedSettingsModel settings = controller.selectedSettings;

    return systems
        .map(
          (system) => DataRow(
            cells: [
              DataCell(Text('${systems.indexOf(system) + 1}',
                  style: TextStyles.tableBody)),
              DataCell(Text(system.name, style: TextStyles.tableBody),
                  showEditIcon: true, onTap: () {
                controller.selectedSystem = system;
                DialogAddEditSystem(context);
              }),
              DataCell(Center(
                  child:
                      Text('${system.quantity}', style: TextStyles.tableBody))),
              DataCell(Center(
                  child: Text('${system.numberOfItems}',
                      style: TextStyles.tableBody))),
              DataCell(Center(
                  child: Text(
                      '${toUnit(settings.area, system.totalArea).toPrecision(1)} ${settings.area.name}',
                      style: TextStyles.tableBody))),
              DataCell(Center(
                  child: Text(
                      '${toUnit(settings.weight, system.totalWeight).toPrecision(1)} ${settings.weight.name}',
                      style: TextStyles.tableBody))),
              DataCell(Center(
                  child: Text(
                      DateFormat('yyyy-MM-dd').format(system.dateCreated),
                      style: TextStyles.tableBody))),
              DataCell(Center(
                  child: Text(
                      DateFormat('yyyy-MM-dd').format(system.dateModified),
                      style: TextStyles.tableBody))),
            ],
            onLongPress: () {
              controller.selectedSystem = system;
              dataTableViewModel.updateView(dataTableViewPages, 2);
              Get.to(DataTableView());
            },
            selected: selectedSystem == system,
            onSelectChanged: (isSelected) {
              final isAdding = isSelected != null && isSelected;
              System? select = controller.selectedSystem;
              isAdding ? select = system : select = null;
              controller.selectedSystem = select;
            },
          ),
        )
        .toList();
  }
}

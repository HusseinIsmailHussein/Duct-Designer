import 'package:duct_area_app/!!!%20controllers/item_controller.dart';
import 'package:duct_area_app/!!!%20controllers/projects_controller.dart';
import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:duct_area_app/!!!%20view/I%20screens/2-%20data%20tables/model/data_tables_view_model.dart';
import 'package:duct_area_app/!%20core/model/item_model.dart';
import 'package:duct_area_app/!!!%20view/I%20screens/1-%20duct%20items/duct_item_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../!! data/constant/duct_items_list.dart';
import '../../../! core/model/selected_settings_model.dart';
import '../../../! core/model/units/dimensions_model.dart';

class DataTableItems extends StatelessWidget {
  DataTableItems({super.key});
  ProjectsController controller = Get.find();
  ItemController itemController = Get.find();
  DataTableViewModel dataTableViewModel = Get.find();

  final columns = [
    'Id',
    'Items Name',
    'Qty',
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
      columns: getColumns(columns, controller),
      rows: getRows(controller),
    );
  }

  List<DataColumn> getColumns(
          List<String> columns, ProjectsController controller) =>
      columns
          .map(
            (column) => DataColumn(
              label: Text(column, style: TextStyles.tableHeader),
              onSort: (columnIndex, ascending) {
                List<Item> items = controller.selectedSystem!.items;
                if (columnIndex == 0) {
                  items.sort((item1, item2) =>
                      compareString(ascending, item1.id ?? 0, item2.id ?? 0));
                } else if (columnIndex == 1) {
                  items.sort((item1, item2) =>
                      compareString(ascending, item1.name, item2.name));
                } else if (columnIndex == 2) {
                  items.sort((item1, item2) =>
                      compareString(ascending, item1.quantity, item2.quantity));
                } else if (columnIndex == 3) {
                  items.sort((item1, item2) => compareString(
                      ascending, item1.totalArea, item2.totalArea));
                } else if (columnIndex == 4) {
                  items.sort((item1, item2) => compareString(
                      ascending, item1.totalWeight, item2.totalWeight));
                } else if (columnIndex == 5) {
                  items.sort((item1, item2) => compareString(
                      ascending, item1.dateCreated, item2.dateCreated));
                } else if (columnIndex == 6) {
                  items.sort((item1, item2) => compareString(
                      ascending, item1.dateModified, item2.dateModified));
                }

                controller.selectedSystem?.items = items;
                controller.sortColumnIndex = columnIndex;
                controller.isAscending = ascending;
              },
            ),
          )
          .toList();

  int compareString(bool ascending, dynamic value1, dynamic value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

  List<DataRow> getRows(ProjectsController controller) {
    Item? selectedItem = controller.selectedItem;
    List<Item> items = controller.selectedSystem!.items;
    SelectedSettingsModel settings = controller.selectedSettings;

    return items
        .map(
          (item) => DataRow(
            cells: [
              DataCell(Text('${items.indexOf(item) + 1}',
                  style: TextStyles.tableBody)),
              DataCell(Text(item.name, style: TextStyles.tableBody)),
              DataCell(Center(
                  child:
                      Text('${item.quantity}', style: TextStyles.tableBody))),
              DataCell(Center(
                  child: Text(
                      '${toUnit(settings.area, item.totalArea).toPrecision(1)} ${settings.area.name}',
                      style: TextStyles.tableBody))),
              DataCell(Center(
                  child: Text(
                      '${toUnit(settings.weight, item.totalWeight).toPrecision(1)} ${settings.weight.name}',
                      style: TextStyles.tableBody))),
              DataCell(Center(
                  child: Text(DateFormat('yyyy-MM-dd').format(item.dateCreated),
                      style: TextStyles.tableBody))),
              DataCell(Center(
                  child: Text(
                      DateFormat('yyyy-MM-dd').format(item.dateModified),
                      style: TextStyles.tableBody))),
            ],
            onLongPress: () {
              controller.selectedItem = item;
              itemController.selectedDuct = ductsList.firstWhere(
                  (duct) => duct.id == controller.selectedItem!.ductId);
              Get.to(() => DuctItemsDetails());
            },
            selected: selectedItem == item,
            onSelectChanged: (isSelected) {
              final isAdding = isSelected != null && isSelected;
              Item? select = controller.selectedItem;
              isAdding ? select = item : select = null;
              controller.selectedItem = select;
            },
          ),
        )
        .toList();
  }
}

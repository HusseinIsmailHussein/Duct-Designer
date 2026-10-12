import 'package:duct_area_app/!!!%20controllers/projects_controller.dart';
import 'package:duct_area_app/!!!%20view/I%20screens/2-%20data%20tables/model/data_tables_view_model.dart';
import 'package:duct_area_app/!%20core/model/selected_settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../! core/model/units/material.dart';
import '../../../!! data/constant/constance.dart';
import '../../../!! data/themes/style/text_style.dart';
import '../../../! core/model/units/dimensions_model.dart';
import '../../I screens/4- material settings/model/material_settings_controller.dart';

class DataTableThickness extends StatelessWidget {
  DataTableThickness({required this.units, super.key});
  MaterialSettingsController controller = Get.find();
  ProjectsController projectController = Get.find();

  DataTableViewModel dataTableViewModel = Get.find();

  String material = 'Galvanized Steel';
  String units;

  @override
  Widget build(BuildContext context) {
    List<String> columns = [
      '',
      units == DimensionName.us ? 'Gauge' : 'Thickness',
    ];

    return GetBuilder<MaterialSettingsController>(builder: (controller) {
      return DataTable(
        headingRowHeight: 35,
        dataRowHeight: 30,
        horizontalMargin: 0,
        columnSpacing: 0,
        columns: getColumns(columns),
        rows: getRows(),
      );
    });
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map(
        (column) => DataColumn(
          label: Text(
            column,
            style: TextStyle(),
            textAlign: TextAlign.center,
          ),
        ),
      )
      .toList();

  int compareString(bool ascending, dynamic value1, dynamic value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

  List<DataRow> getRows() {
    SelectedSettingsModel settings = projectController.selectedSettings;

    List<MaterialDataModel> materials = controller.materialList
        .where((materialX) =>
            materialX.unit == units && materialX.material == material)
        .toList();
    return materials
        .map(
          (material) => DataRow(
            cells: [
              DataCell(Center()),
              DataCell(Center(
                  child: units == DimensionName.us
                      ? Text(material.gauge ?? '-', style: TextStyles.tableBody)
                      : Text(
                          '${toUnit(settings.thickness, material.thickness).toPrecision(2)} ${settings.thickness.name}',
                          style: TextStyles.tableBody))),
            ],
          ),
        )
        .toList();
  }
}

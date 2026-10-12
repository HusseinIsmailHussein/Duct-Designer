import 'package:duct_area_app/!!!%20controllers/projects_controller.dart';
import 'package:duct_area_app/!!!%20view/I%20screens/2-%20data%20tables/model/data_tables_view_model.dart';
import 'package:duct_area_app/!%20core/model/selected_settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../! core/model/units/material.dart';
import '../../../!! data/themes/style/text_style.dart';
import '../../../! core/model/units/dimensions_model.dart';
import '../../I screens/4- material settings/model/material_settings_controller.dart';
import '../dialogs/dialog_edit_material.dart';

class DataTableMaterials extends StatelessWidget {
  DataTableMaterials({required this.material, required this.units, super.key});
  MaterialSettingsController controller = Get.find();

  ProjectsController projectController = Get.find();

  DataTableViewModel dataTableViewModel = Get.find();

  String material;
  String units;

  @override
  Widget build(BuildContext context) {
    SelectedSettingsModel settings = projectController.selectedSettings;

    List<String> columns = ['', material];

    return GetBuilder<MaterialSettingsController>(builder: (controller) {
      return DataTable(
        headingRowHeight: 35,
        dataRowHeight: 30,
        horizontalMargin: 5,
        columnSpacing: 5,
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
            style: TextStyles.tableHeader,
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
              DataCell(
                Center(
                    child: Text(
                        '${fromUnit(settings.area, toUnit(settings.weight, material.density)).toPrecision(2)} ${settings.weight.name}/${settings.area.name}',
                        style: TextStyles.tableBody)),
                showEditIcon: true,
                onTap: () {
                  DialogEditMaterial(material: material);
                },
              ),
            ],
          ),
        )
        .toList();
  }
}

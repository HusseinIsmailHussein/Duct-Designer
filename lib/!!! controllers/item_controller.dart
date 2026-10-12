import 'package:duct_area_app/!!!%20controllers/setting_view_model.dart';
import 'package:duct_area_app/!%20core/functions/db%20functions/materials_db_functions.dart';
import 'package:duct_area_app/!%20core/functions/duct_functions.dart';
import 'package:duct_area_app/!%20core/model/duct_model.dart';
import 'package:duct_area_app/!%20core/model/item_model.dart';
import 'package:get/get.dart';
import '../! core/model/units/material.dart';

class ItemController extends GetxController {
  var materialDBHelper = MaterialsDatabaseHelper.db;
  SettingsController settingsController = Get.find();

  List<MaterialDataModel> _materialList = [];
  List<MaterialDataModel> get materialList => _materialList;
  MaterialDataModel? _selectedMaterial;

  MaterialDataModel? get selectedMaterial => _selectedMaterial;
  set selectedMaterial(MaterialDataModel? selectedMaterial) {
    _selectedMaterial = selectedMaterial;
    update();
  }

  ItemController() {
    getAllMaterial();
    update();
  }

  getAllMaterial() async {
    _materialList = await materialDBHelper.getAllItems();
    _materialList = _materialList
        .where((element) =>
            element.unit ==
                settingsController.selectedSettings.thickness.name &&
            element.material ==
                settingsController.selectedSettings.material.name)
        .toList();

    _materialList.sort((a, b) => a.id.compareTo(b.id));

    _selectedMaterial = _materialList.first;

    update();
  }

  Item _selectedItem = Item(
      systemId: -1,
      projectId: -1,
      ductId: 0,
      quantity: 1,
      variables: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      totalArea: 0,
      totalWeight: 0,
      dateCreated: DateTime.now(),
      dateModified: DateTime.now());
  Item get selectedItem => _selectedItem;
  set selectedItem(Item selectedItem) {
    _selectedItem = selectedItem;
    update();
  }

  DuctModel? _selectedDuct;
  DuctModel? get selectedDuct => _selectedDuct;
  set selectedDuct(DuctModel? selectedDuct) {
    _selectedDuct = selectedDuct;
    update();
  }

  List<String> _errors = [];
  List<String> get errors => _errors;
  set errors(List<String> errors) {
    _errors = errors;
    update();
  }

  calculate() {
    _errors = [];
    errors = DuctFunctions().getErrors(_selectedDuct!, _selectedItem);
    _selectedItem.totalArea =
        DuctFunctions().getTotalArea(_selectedDuct!, _selectedItem, _errors);

    calculateWeight();
  }

  calculateWeight() {
    if (_selectedMaterial == null) {
      _selectedItem.totalWeight = 0;
    } else {
      _selectedItem.totalWeight =
          _selectedItem.totalArea * _selectedMaterial!.density;
    }
    update();
  }

  // dialogAddItem(System? system, Project? project, DuctModel duct,
  //     List<double> variables, SelectedSettingsModel settings) async {
  //   if (system == null || project == null) {
  //     Get.to(NewTestPage());
  //     Get.snackbar(
  //         'Select Unit', 'Select project and unit to save this item to it');
  //   } else {
  //     await ProjectsController().addItem(selectedItem);
  //     Get.offAll(DashboardView());

  //     Get.to(NewTestPage());
  //     Get.snackbar('Item Saved', 'Item has been saved');
  //   }
  // }
}

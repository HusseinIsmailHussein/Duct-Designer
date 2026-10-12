import 'package:duct_area_app/!!!%20controllers/projects_controller.dart';
import 'package:get/get.dart';

import '../! core/functions/db functions/settings_db_functions.dart';
import '../! core/model/selected_settings_model.dart';
import '../!! data/constant/dimensions_list.dart';

class SettingsController extends GetxController {
  ProjectsController controller = Get.find();
  final SelectedSettingsModel _selectedSettings =
      SettingsDatabaseHelper().getSetting();
  SelectedSettingsModel get selectedSettings => _selectedSettings;

  updateLength(int index) {
    _selectedSettings.length = listLengthModel[index];
    update();
  }

  updateWeight(int index) {
    _selectedSettings.weight = listWeightModel[index];
    update();
  }

  updateArea(int index) {
    _selectedSettings.area = listAreaModel[index];
    update();
  }

  updateThickness(int index) {
    _selectedSettings.thickness = listThicknessModel[index];
    update();
  }

  updateMaterial(int index) {
    _selectedSettings.material = listMaterialModel[index];
    update();
  }

  saveSettings() {
    SettingsDatabaseHelper().updateSetting(_selectedSettings);
    controller.selectedSettings = _selectedSettings;
  }
}

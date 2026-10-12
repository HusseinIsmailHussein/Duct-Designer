import 'package:duct_area_app/!%20core/functions/db%20functions/materials_db_functions.dart';
import 'package:duct_area_app/!!%20data/constant/material_list.dart';
import 'package:get/get.dart';

import '../../../../! core/model/units/material.dart';
import '../../../../!! data/constant/constance.dart';

class MaterialSettingsController extends GetxController {
  var materialDBHelper = MaterialsDatabaseHelper.db;
  List<MaterialDataModel> _materialList = [];
  List<MaterialDataModel> get materialList => _materialList;

  String _material = Materials.galvanizedSteel;
  String get material => _material;
  set material(String material) {
    _material = material;
    update();
  }

  String _thicknessUnit = DimensionName.metric;
  String get thicknessUnit => _thicknessUnit;
  set thicknessUnit(String thicknessUnit) {
    _thicknessUnit = thicknessUnit;
    update();
  }

  MaterialSettingsController() {
    getAllMaterial();
    update();
  }

  getAllMaterial() async {
    _materialList = await materialDBHelper.getAllItems();
    update();
  }

  set materialList(List<MaterialDataModel> materialList) {
    _materialList = materialList;
    update();
  }

  updateMaterial(MaterialDataModel material) {
    MaterialDataModel selected =
        _materialList.firstWhere((element) => element.id == material.id);
    int index = _materialList.indexOf(selected);
    _materialList[index] = material;
    update();
  }

  resetMaterialSetting() {
    _materialList =
        standardMaterialList.map((e) => MaterialDataModel.clone(e)).toList();
    update();
  }

  saveMaterialSetting() {
    for (var i = 0; i < _materialList.length; i++) {
      materialDBHelper.update(_materialList[i]);
    }
  }
}

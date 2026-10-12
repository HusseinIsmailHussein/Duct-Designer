import 'dart:convert';

import 'package:duct_area_app/!%20core/model/units/dimensions_model.dart';

import '../../!! data/constant/dimensions_list.dart';

final SelectedSettingsModel defaultSettings = SelectedSettingsModel(
    lengthId: 0, areaId: 10, weightId: 20, thicknessId: 30, materialId: 40);

class SelectedSettingsModel {
  late DimensionsModel length;
  late DimensionsModel area;
  late DimensionsModel thickness;
  late DimensionsModel weight;
  late DimensionsModel material;
  SelectedSettingsModel({
    int lengthId = 0,
    int areaId = 10,
    int weightId = 20,
    int thicknessId = 30,
    int materialId = 40,
  }) {
    length = listLengthModel.firstWhere((e) => e.id == lengthId);
    area = listAreaModel.firstWhere((e) => e.id == areaId);
    weight = listWeightModel.firstWhere((e) => e.id == weightId);
    thickness = listThicknessModel.firstWhere((e) => e.id == thicknessId);
    material = listMaterialModel.firstWhere((e) => e.id == materialId);
  }

  Map<String, dynamic> toMap() {
    return {
      'length': length.id,
      'area': area.id,
      'weight': weight.id,
      'thickness': thickness.id,
      'material': material.id,
    };
  }

  factory SelectedSettingsModel.fromMap(Map<String, dynamic> map) {
    return SelectedSettingsModel(
      lengthId: map['length'] ?? 0,
      areaId: map['area'] ?? 10,
      weightId: map['weight'] ?? 20,
      thicknessId: map['thickness'] ?? 30,
      materialId: map['material'] ?? 40,
    );
  }

  String toJson() => json.encode(toMap());

  factory SelectedSettingsModel.fromJson(String source) =>
      SelectedSettingsModel.fromMap(json.decode(source));
}

class SettingsListModel {
  List length;
  List area;
  List thickness;
  List weight;
  List material;
  SettingsListModel({
    required this.length,
    required this.area,
    required this.thickness,
    required this.weight,
    required this.material,
  });
}

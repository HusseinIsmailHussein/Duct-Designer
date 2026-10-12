import 'dart:convert';

import 'package:duct_area_app/!!%20data/constant/material_list.dart';

import '../../../!! data/constant/constance.dart';

class MaterialFields {
  static const String material = 'material';
  static const String density = 'density';
  static const String thickness = 'thickness';
  static const String gauge = 'gauge';
  static const String unit = 'unit';
  static const String id = 'id';
}

class MaterialDataModel {
  int id;
  String material;
  double density;
  double thickness;
  String unit;
  String? gauge;

  MaterialDataModel(
      {this.gauge,
      required this.id,
      required this.material,
      required this.density,
      required this.thickness,
      required this.unit});

  factory MaterialDataModel.fromThickness(
      {String? gauge,
      required String material,
      required int id,
      required double thickness,
      required String unit}) {
    double density;
    if (material == Materials.aluminum) {
      density = densityAL;
    } else {
      density = densityGI;
    }
    return MaterialDataModel(
        gauge: gauge,
        id: id,
        material: material,
        density: density * thickness,
        thickness: thickness,
        unit: unit);
  }

  factory MaterialDataModel.fromGauge(
      {required String material,
      required String gauge,
      required String unit,
      required int id}) {
    List thicknessList = gaugeToMM.firstWhere((element) => element[0] == gauge);
    double thickness;
    if (material == Materials.aluminum) {
      thickness = thicknessList[2];
    } else {
      thickness = thicknessList[1];
    }
    return MaterialDataModel.fromThickness(
        material: material,
        thickness: thickness,
        unit: unit,
        id: id,
        gauge: gauge);
  }

  Map<String, dynamic> toMap() {
    return {
      'material': material,
      'density': density,
      'thickness': thickness,
      'unit': unit,
      'id': id,
      'gauge': gauge ?? '-',
    };
  }

  factory MaterialDataModel.fromMap(Map<String, dynamic> map) {
    return MaterialDataModel(
      material: map['material'] ?? '',
      density: map['density']?.toDouble() ?? 0.0,
      thickness: map['thickness']?.toDouble() ?? 0.0,
      unit: map['unit'] ?? '',
      id: map['id'] ?? '',
      gauge: map['gauge'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MaterialDataModel.fromJson(String source) =>
      MaterialDataModel.fromMap(json.decode(source));

  factory MaterialDataModel.clone(MaterialDataModel material) {
    return MaterialDataModel(
        id: material.id,
        material: material.material,
        density: material.density,
        thickness: material.thickness,
        unit: material.unit,
        gauge: material.gauge);
  }
}

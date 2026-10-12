import 'dart:math';

import 'package:duct_area_app/!!%20data/constant/constance.dart';

import '../../! core/model/units/dimensions_model.dart';

List<DimensionsModel> listDimensionsModel = [
  DimensionsModel(
      id: 0,
      category: DimensionsCategories.length,
      name: DimensionName.meter,
      multiFactor: 1,
      addFactor: 0),
  DimensionsModel(
      id: 1,
      category: DimensionsCategories.length,
      name: DimensionName.centimeter,
      multiFactor: 100,
      addFactor: 0),
  DimensionsModel(
      id: 2,
      category: DimensionsCategories.length,
      name: DimensionName.millimetre,
      multiFactor: 1000,
      addFactor: 0),
  DimensionsModel(
      id: 3,
      category: DimensionsCategories.length,
      name: DimensionName.feet,
      multiFactor: 100 / 2.54 / 12,
      addFactor: 0),
  DimensionsModel(
      id: 4,
      category: DimensionsCategories.length,
      name: DimensionName.inch,
      multiFactor: 100 / 2.54,
      addFactor: 0),
  DimensionsModel(
      id: 10,
      category: DimensionsCategories.area,
      name: DimensionName.squareMeter,
      multiFactor: 1,
      addFactor: 0),
  DimensionsModel(
      id: 11,
      category: DimensionsCategories.area,
      name: DimensionName.squareFeet,
      multiFactor: pow(100 / 2.54 / 12, 2).toDouble(),
      addFactor: 0),
  DimensionsModel(
      id: 20,
      category: DimensionsCategories.weight,
      name: DimensionName.kilogram,
      multiFactor: 1,
      addFactor: 0),
  DimensionsModel(
      id: 21,
      category: DimensionsCategories.weight,
      name: DimensionName.pound,
      multiFactor: 2.20462,
      addFactor: 0),
  DimensionsModel(
      id: 30,
      category: DimensionsCategories.thickness,
      name: DimensionName.millimetre,
      multiFactor: 1,
      addFactor: 0),
  DimensionsModel(
      id: 31,
      category: DimensionsCategories.thickness,
      name: DimensionName.gauge,
      multiFactor: 1,
      addFactor: 0),
  DimensionsModel(
      id: 40,
      category: DimensionsCategories.material,
      name: Materials.galvanizedSteel,
      multiFactor: 7.85,
      addFactor: 0),
  DimensionsModel(
      id: 41,
      category: DimensionsCategories.material,
      name: Materials.aluminum,
      multiFactor: 2.71,
      addFactor: 0),
];

final List listLengthModel = listDimensionsModel
    .where((e) => e.category == DimensionsCategories.length)
    .toList();

final List listWeightModel = listDimensionsModel
    .where((e) => e.category == DimensionsCategories.weight)
    .toList();

final List listAreaModel = listDimensionsModel
    .where((e) => e.category == DimensionsCategories.area)
    .toList();

final List listThicknessModel = listDimensionsModel
    .where((e) => e.category == DimensionsCategories.thickness)
    .toList();

final List listMaterialModel = listDimensionsModel
    .where((e) => e.category == DimensionsCategories.material)
    .toList();

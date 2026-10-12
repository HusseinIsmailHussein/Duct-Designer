import '../../! core/model/units/material.dart';
import 'constance.dart';

double densityGI = 7.9;
double densityAL = 2.7;

// Gauge GI mm AL mm
List<List<dynamic>> gaugeToMM = [
  ['G18', 1.214, 1.024],
  ['G20', 0.912, 0.813],
  ['G22', 0.759, 0.643],
  ['G24', 0.607, 0.536],
  ['G26', 0.455, 0.404],
];

final List<MaterialDataModel> standardMaterialList = [
  MaterialDataModel.fromThickness(
      id: 1,
      material: Materials.galvanizedSteel,
      thickness: .5,
      unit: DimensionName.metric),
  MaterialDataModel.fromThickness(
      id: 2,
      material: Materials.galvanizedSteel,
      thickness: .6,
      unit: DimensionName.metric),
  MaterialDataModel.fromThickness(
      id: 3,
      material: Materials.galvanizedSteel,
      thickness: .7,
      unit: DimensionName.metric),
  MaterialDataModel.fromThickness(
      id: 4,
      material: Materials.galvanizedSteel,
      thickness: .8,
      unit: DimensionName.metric),
  MaterialDataModel.fromThickness(
      id: 5,
      material: Materials.galvanizedSteel,
      thickness: 1,
      unit: DimensionName.metric),
  MaterialDataModel.fromThickness(
      id: 11,
      material: Materials.aluminum,
      thickness: .5,
      unit: DimensionName.metric),
  MaterialDataModel.fromThickness(
      id: 12,
      material: Materials.aluminum,
      thickness: .6,
      unit: DimensionName.metric),
  MaterialDataModel.fromThickness(
      id: 13,
      material: Materials.aluminum,
      thickness: .7,
      unit: DimensionName.metric),
  MaterialDataModel.fromThickness(
      id: 14,
      material: Materials.aluminum,
      thickness: .8,
      unit: DimensionName.metric),
  MaterialDataModel.fromThickness(
      id: 15,
      material: Materials.aluminum,
      thickness: 1,
      unit: DimensionName.metric),
  MaterialDataModel.fromGauge(
      id: 25,
      material: Materials.galvanizedSteel,
      gauge: 'G18',
      unit: DimensionName.us),
  MaterialDataModel.fromGauge(
      id: 24,
      material: Materials.galvanizedSteel,
      gauge: 'G20',
      unit: DimensionName.us),
  MaterialDataModel.fromGauge(
      id: 23,
      material: Materials.galvanizedSteel,
      gauge: 'G22',
      unit: DimensionName.us),
  MaterialDataModel.fromGauge(
      id: 22,
      material: Materials.galvanizedSteel,
      gauge: 'G24',
      unit: DimensionName.us),
  MaterialDataModel.fromGauge(
      id: 21,
      material: Materials.galvanizedSteel,
      gauge: 'G26',
      unit: DimensionName.us),
  MaterialDataModel.fromGauge(
      id: 35,
      material: Materials.aluminum,
      gauge: 'G18',
      unit: DimensionName.us),
  MaterialDataModel.fromGauge(
      id: 34,
      material: Materials.aluminum,
      gauge: 'G20',
      unit: DimensionName.us),
  MaterialDataModel.fromGauge(
      id: 33,
      material: Materials.aluminum,
      gauge: 'G22',
      unit: DimensionName.us),
  MaterialDataModel.fromGauge(
      id: 32,
      material: Materials.aluminum,
      gauge: 'G24',
      unit: DimensionName.us),
  MaterialDataModel.fromGauge(
      id: 31,
      material: Materials.aluminum,
      gauge: 'G26',
      unit: DimensionName.us),
];

import 'dart:math';

import 'item_model.dart';
import 'project_setting.dart';

class PDModel {
  String shape;
  String material;
  ProjectSettings projectSettings;

  late ItemModel airFlow;
  late ItemModel height;
  late ItemModel width;
  late ItemModel length;
  late double aspectRatio;
  late ItemModel friction;
  late ItemModel velocity;
  late ItemModel pressureDrop;

  PDModel(
      {required this.shape,
      required this.material,
      required this.projectSettings,
      required String airFlowNumber,
      required String heightNumber,
      required String widthNumber,
      required String lengthNumber}) {
    airFlow = ItemModel(
        number: airFlowNumber, setting: projectSettings.airFlowSetting);

    height =
        ItemModel(number: heightNumber, setting: projectSettings.heightSetting);

    width =
        ItemModel(number: widthNumber, setting: projectSettings.widthSetting);

    length =
        ItemModel(number: lengthNumber, setting: projectSettings.lengthSetting);

    aspectRatio = height.value / width.value;

    double equDiam = 1.3 *
        pow((height.value * width.value), 0.625) /
        pow((height.value + width.value), 0.25);

    double velocityV = airFlow.value / (height.value * width.value);
    double frictionV =
        1 / (50 * 1.095) * pow(airFlow.value, 1.9) / pow(equDiam, 5.02);
    double pressureDropV = length.value * frictionV;

    velocity = ItemModel.calculated(
        setting: projectSettings.velocitySetting, value: velocityV);

    friction = ItemModel.calculated(
        setting: projectSettings.frictionSetting, value: frictionV);
    pressureDrop = ItemModel.calculated(
        setting: projectSettings.pressureDropSetting, value: pressureDropV);
  }
}

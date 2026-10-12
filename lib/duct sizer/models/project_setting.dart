import 'setting_model.dart';

class ProjectSettings {
  late SettingModel airFlowSetting;
  late SettingModel widthSetting;
  late SettingModel lengthSetting;
  late SettingModel heightSetting;
  late SettingModel velocitySetting;
  late SettingModel frictionSetting;
  late SettingModel pressureDropSetting;

  ProjectSettings({
    required String airFlowUnit,
    required String widthUnit,
    required String lengthUnit,
    required String heightUnit,
    required String velocityUnit,
    required String frictionUnit,
    required String pressureDropUnit,
  }) {
    airFlowSetting = SettingModel(
        dimension: 'Air Flow Rate', category: 'Flow Rate', unit: airFlowUnit);

    widthSetting =
        SettingModel(dimension: 'Width', category: 'Distance', unit: widthUnit);
    lengthSetting = SettingModel(
        dimension: 'Length', category: 'Distance', unit: lengthUnit);
    heightSetting = SettingModel(
        dimension: 'Height', category: 'Distance', unit: heightUnit);
    velocitySetting = SettingModel(
        dimension: 'Velocity', category: 'Velocity', unit: velocityUnit);
    frictionSetting = SettingModel(
        dimension: 'Friction', category: 'Friction', unit: frictionUnit);
    pressureDropSetting = SettingModel(
        dimension: 'Pressure Drop',
        category: 'Pressure',
        unit: pressureDropUnit);
  }
}

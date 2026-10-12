import '../data/data.dart';

class SettingModel {
  String dimension;
  String category;
  String unit;
  late double rate;
  late List<String> dimensionsList;
  SettingModel(
      {required this.dimension, required this.category, required this.unit}) {
    List<Map<String, double>> categoryList = Data.settingsMap[category]!;
    for (Map<String, double> map in categoryList) {
      if (map.containsKey(unit)) {
        rate = map[unit] ?? 1;
      }
    }

    dimensionsList = [];
    for (var item in Data.settingsMap[category]!) {
      dimensionsList.addAll(item.keys);
    }
  }
}

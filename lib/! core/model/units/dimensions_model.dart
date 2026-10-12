class DimensionsCategories {
  static const String length = 'Length';
  static const String area = 'Area';
  static const String angle = 'angle';

  static const String weight = 'Weight';
  static const String thickness = 'Thickness';
  static const String material = 'Material';
}

class DimensionsModel {
  int id;
  String category;
  String name;
  double multiFactor = 1;
  double addFactor = 0;

  DimensionsModel({
    required this.id,
    required this.category,
    required this.name,
    required this.multiFactor,
    required this.addFactor,
  });
}

double fromUnit(DimensionsModel dimension, double value) {
  return (value - dimension.addFactor) / dimension.multiFactor;
}

double toUnit(DimensionsModel dimension, double value) {
  return (value * dimension.multiFactor) + dimension.addFactor;
}

class ThicknessConverter {
  int gauge;
  double mmGI;
  double mmAL;
  ThicknessConverter({
    required this.gauge,
    required this.mmGI,
    required this.mmAL,
  });
}

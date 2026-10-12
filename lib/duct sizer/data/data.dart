class Data {
  static Map<String, List<Map<String, double>>> settingsMap = {
    'Flow Rate': [
      {'cfm': (0.3048 * 0.3048 * 0.3048) / 60},
      {'l/min': 1 / 1000 / 60},
      {'m3/h': 1 / 60 / 60},
      {'m3/m': 1 / 60},
      {'m3/s': 1},
    ],
    'Velocity': [
      {'m/s': 1},
      {'ft/s': 0.3048},
    ],
    'Distance': [
      {'mm': 1 / 1000},
      {'cm': 1 / 100},
      {'mt': 1},
      {'inch': 0.0254},
      {'ft': 0.3048},
    ],
    'Pressure': [
      {'Pa': 1},
      {'inch': 249},
    ],
    'Friction': [
      {'Pa/m': 1},
      {'inch/100ft': 249 / 100 / 0.3048},
    ]
  };

  static List<String> airFlowDim = ['cfm', 'l/min', 'm3/h', 'm3/m', 'm3/s'];
  static List<String> distanceDim = ['mm', 'cm', 'mt', 'inch', 'ft'];
  static List<String> velocityDim = ['m/s', 'ft/s'];
  static List<String> pressureDim = ['Pa', 'inch'];
  static List<String> frictionDim = ['Pa/m', 'inch/100ft'];
}

import 'dart:convert';

import '../../!! data/constant/duct_items_list.dart';

class ItemFields {
  static const String id = 'id';
  static const String ductId = 'ductId';
  static const String systemId = 'systemId';
  static const String projectId = 'projectId';
  static const String quantity = 'quantity';
  static const String totalWeight = 'totalWeight';
  static const String totalArea = 'totalArea';
  static const String dateCreated = 'dateCreated';
  static const String dateModified = 'dateModified';
  static const String variables = 'variables';
}

final List<double> defaultVariables = [
  0,
  0,
  0,
  0,
  0,
  0,
];

final Item defaultItem = Item(
    ductId: 0,
    quantity: 1,
    variables: defaultVariables,
    totalArea: 0,
    totalWeight: 0,
    dateCreated: DateTime.now(),
    dateModified: DateTime.now(),
    systemId: -1,
    projectId: -1);

class Item {
  int? id;
  int ductId;
  int systemId;
  int projectId;
  int quantity;
  late String name;
  List<double> variables;
  double totalArea;
  double totalWeight;
  DateTime dateCreated;
  DateTime dateModified;
  Item({
    this.id,
    required this.systemId,
    required this.projectId,
    required this.ductId,
    required this.quantity,
    required this.variables,
    required this.totalArea,
    required this.totalWeight,
    required this.dateCreated,
    required this.dateModified,
  }) {
    name = ductsList.firstWhere((e) => e.id == ductId).name;
  }

  Map<String, dynamic> toMap() {
    return {
      'ductId': ductId,
      'systemId': systemId,
      'projectId': projectId,
      'quantity': quantity,
      'variables': variables.toString(),
      'totalArea': totalArea,
      'totalWeight': totalWeight,
      'dateCreated': dateCreated.toIso8601String(),
      'dateModified': dateModified.toIso8601String(),
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id']?.toInt(),
      ductId: map['ductId']?.toInt() ?? 0,
      systemId: map['systemId']?.toInt() ?? -1,
      projectId: map['projectId']?.toInt() ?? -1,
      quantity: map['quantity']?.toInt() ?? 1,
      variables: json.decode(map['variables']).cast<double>().toList() ?? [],
      totalArea: map['totalArea']?.toDouble() ?? 0.0,
      totalWeight: map['totalWeight']?.toDouble() ?? 0.0,
      dateCreated: DateTime.parse(map['dateCreated']),
      dateModified: DateTime.parse(map['dateModified']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));
}

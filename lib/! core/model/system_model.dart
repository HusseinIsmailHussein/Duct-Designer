import 'dart:convert';

import 'package:duct_area_app/!%20core/model/item_model.dart';

class SystemFields {
  static const String id = 'id';
  static const String name = 'name';
  static const String projectId = 'projectId';
  static const String quantity = 'quantity';
  static const String totalWeight = 'totalWeight';
  static const String totalArea = 'totalArea';
  static const String numberOfItems = 'numberOfItems';
  static const String dateCreated = 'dateCreated';
  static const String dateModified = 'dateModified';
}

class System {
  int? id;
  int projectId;
  String name;
  double totalWeight;
  double totalArea;
  int quantity;
  int numberOfItems;
  DateTime dateCreated;
  DateTime dateModified;
  List<Item> items = [];

  System({
    this.id,
    required this.name,
    this.projectId = -1,
    this.totalWeight = 0,
    this.totalArea = 0,
    this.quantity = 1,
    this.numberOfItems = 0,
    required this.dateCreated,
    required this.dateModified,
  });

  Map<String, dynamic> toMap() {
    return {
      'projectId': projectId,
      'quantity': quantity,
      'name': name,
      'totalWeight': totalWeight,
      'totalArea': totalArea,
      'numberOfItems': numberOfItems,
      'dateCreated': dateCreated.toIso8601String(),
      'dateModified': dateModified.toIso8601String(),
    };
  }

  factory System.fromMap(Map<String, dynamic> map) {
    return System(
      id: map['id']?.toInt() ?? 0,
      projectId: map['projectId']?.toInt() ?? -1,
      quantity: map['quantity']?.toInt() ?? 1,
      name: map['name'] ?? '',
      totalWeight: map['totalWeight']?.toDouble() ?? 0.0,
      totalArea: map['totalArea']?.toDouble() ?? 0.0,
      numberOfItems: map['numberOfItems']?.toInt() ?? 0,
      dateCreated: DateTime.parse(map['dateCreated']),
      dateModified: DateTime.parse(map['dateModified']),
    );
  }

  String toJson() => json.encode(toMap());

  factory System.fromJson(String source) => System.fromMap(json.decode(source));
}

import 'dart:convert';

import 'package:duct_area_app/!%20core/model/system_model.dart';

class ProjectFields {
  static const String id = 'id';
  static const String name = 'name';
  static const String totalWeight = 'totalWeight';
  static const String totalArea = 'totalArea';
  static const String numberOfUnits = 'numberOfUnits';
  static const String numberOfItems = 'numberOfItems';
  static const String dateCreated = 'dateCreated';
  static const String dateModified = 'dateModified';
  static const String systemsId = 'systemsId';
}

Project defaultProject = Project(
    name: 'New Project',
    totalWeight: 0,
    totalArea: 0,
    numberOfUnits: 0,
    numberOfItems: 0,
    dateCreated: DateTime.now(),
    dateModified: DateTime.now());

class Project {
  int? id;
  String name;
  double totalWeight;
  double totalArea;
  int numberOfUnits;
  int numberOfItems;
  DateTime dateCreated;
  DateTime dateModified;
  List<System> systems = [];

  Project({
    this.id,
    required this.name,
    required this.totalWeight,
    required this.totalArea,
    required this.numberOfUnits,
    required this.numberOfItems,
    required this.dateCreated,
    required this.dateModified,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'totalWeight': totalWeight,
      'totalArea': totalArea,
      'numberOfUnits': numberOfUnits,
      'numberOfItems': numberOfItems,
      'dateCreated': dateCreated.toIso8601String(),
      'dateModified': dateModified.toIso8601String(),
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      totalWeight: map['totalWeight']?.toDouble() ?? 0.0,
      totalArea: map['totalArea']?.toDouble() ?? 0.0,
      numberOfUnits: map['numberOfUnits']?.toInt() ?? 0,
      numberOfItems: map['numberOfItems']?.toInt() ?? 0,
      dateCreated: DateTime.parse(map['dateCreated']),
      dateModified: DateTime.parse(map['dateModified']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) =>
      Project.fromMap(json.decode(source));
}

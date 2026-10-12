import 'package:duct_area_app/!%20core/model/units/material.dart';
import 'package:duct_area_app/!!%20data/constant/constance.dart';
import '../../../!! data/database/database.dart';

class MaterialsDatabaseHelper {
  MaterialsDatabaseHelper._();

  static final MaterialsDatabaseHelper db = MaterialsDatabaseHelper._();

  final database = DatabaseRepository().database;

  Future<List<MaterialDataModel>> getAllItems() async {
    var db = await database;
    List<Map<String, dynamic>> maps = await db.query(tableMaterials);
    List<MaterialDataModel> list = maps.isNotEmpty
        ? maps.map((item) => MaterialDataModel.fromMap(item)).toList()
        : [];
    return list;
  }

  Future<MaterialDataModel> getItem(int materialId) async {
    var db = await database;
    List<Map<String, dynamic>> maps = await db.rawQuery('''
    SELECT * FROM $tableMaterials 
    WHERE ${MaterialFields.id} = $materialId
    ''');
    MaterialDataModel material = MaterialDataModel.fromMap(maps.first);
    return material;
  }

  insert(MaterialDataModel model) async {
    var db = await database;
    await db.insert(tableMaterials, model.toMap());
  }

  update(MaterialDataModel material) async {
    var db = await database;
    await db.update(tableMaterials, material.toMap(),
        where: '${MaterialFields.id} =?', whereArgs: [material.id]);
  }
}

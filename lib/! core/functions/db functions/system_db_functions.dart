import 'package:duct_area_app/!!%20data/constant/constance.dart';
import 'package:duct_area_app/!%20core/model/project_model.dart';

import '../../model/system_model.dart';
import '../../../!! data/database/database.dart';
import 'items_db_functions.dart';

class SystemDatabaseHelper {
  SystemDatabaseHelper._();

  static final SystemDatabaseHelper db = SystemDatabaseHelper._();

  final database = DatabaseRepository().database;

  Future<List<System>> getAllSystems() async {
    var db = await database;
    List<Map<String, dynamic>> maps = await db.query(tableSystem);
    List<System> list = maps.isNotEmpty
        ? maps.map((system) => System.fromMap(system)).toList()
        : [];
    for (var indexS = 0; indexS < list.length; indexS++) {
      list[indexS].items =
          await ItemsDatabaseHelper.db.getItemsBySystem(list[indexS]);
    }
    return list;
  }

  Future<System> getSystem(int systemId) async {
    var db = await database;
    List<Map<String, dynamic>> maps = await db.rawQuery('''
    SELECT * FROM $tableSystem 
    WHERE ${SystemFields.id} = $systemId
    ''');
    System system = System.fromMap(maps.first);
    system.items = await ItemsDatabaseHelper.db.getItemsBySystem(system);
    return system;
  }

  Future<List<System>> getSystemsByProject(Project project) async {
    var db = await database;
    List<Map<String, dynamic>> maps = await db.rawQuery('''
    SELECT * FROM $tableSystem 
    WHERE ${SystemFields.projectId} = ${project.id}
    ''');

    List<System> list = maps.isNotEmpty
        ? maps.map((system) => System.fromMap(system)).toList()
        : [];

    for (var indexS = 0; indexS < list.length; indexS++) {
      list[indexS].items =
          await ItemsDatabaseHelper.db.getItemsBySystem(list[indexS]);
    }
    return list;
  }

  Future<int> insert(System model) async {
    var db = await database;
    return await db.insert(tableSystem, model.toMap());
  }

  update(System model) async {
    var db = await database;
    await db.update(tableSystem, model.toMap(),
        where: '${SystemFields.id} =?', whereArgs: [model.id]);
  }

  delete(System model) async {
    var db = await database;
    await db.delete(tableSystem,
        where: '${SystemFields.id} =?', whereArgs: [model.id]);
  }
}

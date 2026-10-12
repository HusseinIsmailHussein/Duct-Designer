import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../! core/model/units/material.dart';
import '../constant/constance.dart';
import '../../! core/model/item_model.dart';
import '../../! core/model/project_model.dart';
import '../../! core/model/system_model.dart';
import '../constant/material_list.dart';

class DatabaseRepository {
  DatabaseRepository();

  static final DatabaseRepository db = DatabaseRepository();

  static Database? _database;

  get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'database.db');
    const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const String intType = 'INTEGER NOT NULL';
    const String textType = 'TEXT NOT NULL';
    const String doubleType = 'REAL NOT NULL';

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(''' CREATE TABLE $tableProject (
        ${ProjectFields.id} $idType,
        ${ProjectFields.name} $textType,
        ${ProjectFields.dateCreated} $textType,
        ${ProjectFields.dateModified} $textType,
        ${ProjectFields.totalWeight} $doubleType,
        ${ProjectFields.totalArea} $doubleType,
        ${ProjectFields.numberOfUnits} $intType,
        ${ProjectFields.numberOfItems} $intType) ''');

      await db.execute(''' CREATE TABLE $tableSystem (
        ${SystemFields.id} $idType,
        ${SystemFields.projectId} $intType,
        ${SystemFields.name} $textType,
        ${SystemFields.quantity} $intType,
        ${SystemFields.dateCreated} $textType,
        ${SystemFields.dateModified} $textType,
        ${SystemFields.totalWeight} $doubleType,
        ${SystemFields.totalArea} $doubleType,
        ${SystemFields.numberOfItems} $intType) ''');

      await db.execute(''' CREATE TABLE $tableItem (
        ${ItemFields.id} $idType,
        ${ItemFields.ductId} $intType,
        ${SystemFields.projectId} $intType,
        ${ItemFields.systemId} $intType,
        ${ItemFields.quantity} $intType,
        ${ItemFields.dateCreated} $textType,
        ${ItemFields.variables} $textType,
        ${ItemFields.dateModified} $textType,
        ${ItemFields.totalWeight} $doubleType,
        ${ItemFields.totalArea} $doubleType)''');

      await db.execute(''' CREATE TABLE $tableMaterials (
        ${MaterialFields.id} $intType,
        ${MaterialFields.material} $textType,
        ${MaterialFields.gauge} $textType,
        ${MaterialFields.density} $doubleType,
        ${MaterialFields.thickness} $doubleType,
        ${MaterialFields.unit} $textType)''');

      for (var i = 0; i < standardMaterialList.length; i++) {
        await db.insert(tableMaterials, standardMaterialList[i].toMap());
        print(standardMaterialList[i].id);
      }
    });
  }
}

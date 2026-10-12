import 'package:duct_area_app/!!%20data/constant/constance.dart';
import 'package:duct_area_app/!%20core/model/system_model.dart';

import '../../model/item_model.dart';
import '../../../!! data/database/database.dart';

class ItemsDatabaseHelper {
  ItemsDatabaseHelper._();

  static final ItemsDatabaseHelper db = ItemsDatabaseHelper._();

  final database = DatabaseRepository().database;

  Future<List<Item>> getAllItems() async {
    var db = await database;
    List<Map<String, dynamic>> maps = await db.query(tableItem);
    List<Item> list =
        maps.isNotEmpty ? maps.map((item) => Item.fromMap(item)).toList() : [];
    return list;
  }

  Future<Item> getItem(int itemId) async {
    var db = await database;
    List<Map<String, dynamic>> maps = await db.rawQuery('''
    SELECT * FROM $tableItem 
    WHERE ${ItemFields.id} = $itemId
    ''');
    Item item = Item.fromMap(maps.first);
    return item;
  }

  Future<List<Item>> getItemsBySystem(System system) async {
    var db = await database;
    List<Map<String, dynamic>> maps = await db.rawQuery('''
    SELECT * FROM $tableItem 
    WHERE ${ItemFields.systemId} = ${system.id}
    ''');
    List<Item> list =
        maps.isNotEmpty ? maps.map((item) => Item.fromMap(item)).toList() : [];
    return list;
  }

  insert(Item model) async {
    var db = await database;
    await db.insert(tableItem, model.toMap());
  }

  update(Item item) async {
    var db = await database;
    await db.update(tableItem, item.toMap(),
        where: '${ItemFields.id} =?', whereArgs: [item.id]);
  }

  delete(Item model) async {
    var db = await database;
    await db
        .delete(tableItem, where: '${ItemFields.id} =?', whereArgs: [model.id]);
  }
}

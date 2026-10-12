import 'package:duct_area_app/!!%20data/constant/constance.dart';
import 'package:duct_area_app/!%20core/functions/db%20functions/system_db_functions.dart';
import 'package:duct_area_app/!%20core/model/project_model.dart';

import '../../../!! data/database/database.dart';

class ProjectDatabaseHelper {
  ProjectDatabaseHelper._();

  static final ProjectDatabaseHelper db = ProjectDatabaseHelper._();

  final database = DatabaseRepository().database;

  Future<List<Project>> getAllProjects() async {
    var db = await database;
    List<Map<String, dynamic>> maps = await db.query(tableProject);
    List<Project> list = maps.isNotEmpty
        ? maps.map((project) => Project.fromMap(project)).toList()
        : [];

    for (var indexP = 0; indexP < list.length; indexP++) {
      list[indexP].systems =
          await SystemDatabaseHelper.db.getSystemsByProject(list[indexP]);
    }
    return list;
  }

  Future<Project> getProject(int projectId) async {
    var db = await database;
    List<Map<String, dynamic>> maps = await db.rawQuery('''
    SELECT * FROM $tableProject 
    WHERE ${ProjectFields.id} = $projectId
    ''');
    Project project = Project.fromMap(maps.first);
    project.systems =
        await SystemDatabaseHelper.db.getSystemsByProject(project);

    return project;
  }

  Future<int> insert(Project model) async {
    var db = await database;
    return await db.insert(tableProject, model.toMap());
  }

  update(Project model) async {
    var db = await database;
    await db.update(tableProject, model.toMap(),
        where: '${ProjectFields.id} =?', whereArgs: [model.id]);
  }

  delete(Project model) async {
    var db = await database;
    await db.delete(tableProject,
        where: '${ProjectFields.id} =?', whereArgs: [model.id]);
  }
}

// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:duct_area_app/!%20core/functions/db%20functions/projects_db_functions.dart';
import 'package:duct_area_app/!%20core/functions/db%20functions/system_db_functions.dart';
import 'package:duct_area_app/!%20core/model/item_model.dart';
import 'package:duct_area_app/!%20core/model/project_model.dart';
import 'package:duct_area_app/!%20core/model/selected_settings_model.dart';
import 'package:duct_area_app/!%20core/model/system_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../! core/functions/db functions/settings_db_functions.dart';
import '../! core/functions/db functions/items_db_functions.dart';

//! Add Project / System / Item

class ProjectsController extends GetxController {
  ProjectsController() {
    getAllProjects();
  }

//! system settings
  SelectedSettingsModel _selectedSettings =
      SettingsDatabaseHelper().getSetting();
  SelectedSettingsModel get selectedSettings => _selectedSettings;
  set selectedSettings(SelectedSettingsModel selectedSettings) {
    _selectedSettings = selectedSettings;
    update();
  }

  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  //! Items selection

  int? _indexP;
  int? get indexP => _indexP;
  set indexP(int? indexP) {
    _indexP = indexP;
    if (indexP == null) {
      _selectedProject = null;
    } else {
      _selectedProject = _projectsList[indexP];
      print('project selected');
    }
    update();
  }

  Project? _selectedProject;
  Project? get selectedProject => _selectedProject;

  set selectedProject(Project? selectedProject) {
    print('project selected');
    if (selectedProject == null) {
      indexP = null;
    } else {
      indexP = _projectsList.indexOf(selectedProject);
    }
    indexS = null;
    indexI = null;
    update();
  }

  int? _indexS;
  int? get indexS => _indexS;
  set indexS(int? indexS) {
    _indexS = indexS;
    if (indexS == null || indexP == null) {
      _selectedSystem = null;
    } else {
      _selectedSystem = _projectsList[indexP!].systems[indexS];
    }
    update();
  }

  System? _selectedSystem;
  System? get selectedSystem => _selectedSystem;
  set selectedSystem(System? selectedSystem) {
    if (selectedSystem == null || indexP == null) {
      indexS = null;
    } else {
      indexS = _projectsList[indexP!].systems.indexOf(selectedSystem);
    }
    indexI = null;
    update();
  }

  int? _indexI;
  int? get indexI => _indexI;
  set indexI(int? indexI) {
    _indexI = indexI;
    if (indexS == null || indexP == null || indexI == null) {
      _selectedItem = null;
    } else {
      _selectedItem = _projectsList[indexP!].systems[indexS!].items[indexI];
    }
    update();
  }

  Item? _selectedItem;
  Item? get selectedItem => _selectedItem;
  set selectedItem(Item? selectedItem) {
    if (selectedItem == null || indexP == null || indexS == null) {
      indexI = null;
    } else {
      indexI =
          _projectsList[indexP!].systems[indexS!].items.indexOf(selectedItem);
    }
    update();
  }

  //! Lists
  List<Project> _projectsList = [];
  List<Project> get projectsList => _projectsList;
  set projectsList(List<Project> projectsList) {
    _projectsList = projectsList;
    update();
  }

  List<System> _systemsList = [];
  List<System> get systemsList => _systemsList;
  set systemsList(List<System> systemsList) {
    _systemsList = systemsList;
    update();
  }

  List<Item> _itemsList = [];
  List<Item> get itemsLis => _itemsList;
  set itemsLis(List<Item> itemsLis) {
    _itemsList = itemsLis;
    update();
  }

  //! Database Helper
  var projectDbHelper = ProjectDatabaseHelper.db;
  var systemDbHelper = SystemDatabaseHelper.db;
  var itemDbHelper = ItemsDatabaseHelper.db;

  //!get all items
  getAllProjects() async {
    _loading.value = true;
    _projectsList = await projectDbHelper.getAllProjects();
    _loading.value = false;
    update();
  }

  getAllSystems() async {
    _loading.value = true;
    _systemsList = await systemDbHelper.getAllSystems();
    _loading.value = false;
    update();
  }

  getAllItems() async {
    _loading.value = true;
    _itemsList = await itemDbHelper.getAllItems();
    _loading.value = false;
    update();
  }

  Project getSelectedProject() {
    if (_projectsList.isEmpty) {
      addProject('New Project');
    }
    return _selectedProject ?? _projectsList.first;
  }

  // System getSelectedSystem() {
  //   return getSystem(_selectedSystem!.id);
  // }

  void copyWholeProject(Project project) async {
    project.id = await projectDbHelper.insert(project);
    for (var indexS = 0; indexS < project.systems.length; indexS++) {
      System system = project.systems[indexS];
      system.projectId = project.id!;
      for (var indexI = 0; indexI < system.items.length; indexI++) {
        Item item = system.items[indexI];
        item.projectId = system.projectId;
        item.systemId = system.id!;
        await itemDbHelper.insert(item);
      }
    }
    project.systems = await systemDbHelper.getSystemsByProject(project);
    await updateDBProject(project);
    getAllProjects();
  }

  Future<Project> createProject(Project project) async {
    await projectDbHelper.insert(project);
    return project;
  }

  Project getProject(int? id) {
    if (_projectsList.isEmpty) {
      addProject('New Project');
    }
    return _projectsList.firstWhere((project) => project.id == id);
  }

  // System getSystem(int? id) {
  //   Project project = getSelectedProject();
  //   if (project.systems.isEmpty) {
  //     addSystem('New Unit', 1);
  //   }
  //   return project.systems.firstWhere((system) => system.id == id);
  // }

  //! Get Item data from DataBase
  getProjectDB(Project project) async {
    int projectId = project.id ?? -1;
    _projectsList[getIndexP(project)] =
        await projectDbHelper.getProject(projectId);
  }

  getSystemDB(System system, {Project? project}) async {
    project = project ?? getProjectFromSystem(system);
    int systemId = system.id ?? -1;
    _projectsList[getIndexP(project)].systems[getIndexS(system, project)] =
        await systemDbHelper.getSystem(systemId);
    update();
  }

  int _sortColumnIndex = 0;
  int get sortColumnIndex => _sortColumnIndex;
  set sortColumnIndex(int sortColumnIndex) {
    _sortColumnIndex = sortColumnIndex;
    update();
  }

  bool _isAscending = false;
  bool get isAscending => _isAscending;
  set isAscending(bool sortColumnIndex) {
    _isAscending = isAscending;
    update();
  }

//! Support Methods
  Project getProjectFromSystem(System system) =>
      _projectsList.firstWhere((project) => project.id == system.projectId);

  Project getProjectFromItem(Item item) =>
      _projectsList.firstWhere((project) => project.id == item.projectId);

  Project getProjectFromID(int id) =>
      _projectsList.firstWhere((project) => project.id == id);

  System getSystemFromItem(Project project, Item item) =>
      project.systems.firstWhere((system) => system.id == item.systemId);

  System getSystemFromID(int id, Project project) =>
      project.systems.firstWhere((system) => system.id == id);

  int getIndexP(Project project) {
    Project projectL =
        _projectsList.firstWhere((element) => element.id == project.id);
    return _projectsList.indexOf(projectL);
  }

  int getIndexPFromId(int id) {
    Project project = _projectsList.firstWhere((element) => element.id == id);
    return _projectsList.indexOf(project);
  }

  int getIndexS(System system, Project project) {
    System systemL =
        project.systems.firstWhere((element) => element.id == system.id);
    return project.systems.indexOf(systemL);
  }

  int getIndexI(Item item, System system) => system.items.indexOf(item);

  //! delete project / item /

  deleteProject() async {
    if (indexP != null) {
      Project project = _projectsList[indexP!];
      await projectDbHelper.delete(project);
      for (var index = 0; index < project.systems.length; index++) {
        System system = _projectsList[indexP!].systems[index];
        await systemDbHelper.delete(system);
        for (var i = 0; i < system.items.length; i++) {
          Item item = _projectsList[indexP!].systems[index].items[i];
          await itemDbHelper.delete(item);
        }
      }
      getAllProjects();
      update();
    }
  }

  deleteSystem() async {
    if (indexP != null && indexS != null) {
      System system = _projectsList[indexP!].systems[indexS!];
      await systemDbHelper.delete(system);
      for (var i = 0; i < system.items.length; i++) {
        Item item = _projectsList[indexP!].systems[indexS!].items[i];
        await itemDbHelper.delete(item);
      }
      await getProjectDB(_projectsList[indexP!]);
      updateProjectDataDB();
      await projectDbHelper.update(_projectsList[indexP!]);
      indexS = null;
      indexP = _indexP;
      update();
    }
  }

  deleteItem() async {
    if (indexP != null && indexS != null && indexI != null) {
      Item item = _projectsList[indexP!].systems[indexS!].items[indexI!];
      await itemDbHelper.delete(item);
      await getProjectDB(_projectsList[indexP!]);
      updateSystemDataDB();
      updateProjectDataDB();
      await systemDbHelper.update(_projectsList[indexP!].systems[indexS!]);
      await projectDbHelper.update(_projectsList[indexP!]);
      indexP = _indexP;
      indexS = _indexS;
      update();
    }
  }

//! copy project / system/ item

  copyProject() async {
    if (indexP != null) {
      Project project = _projectsList[indexP!];
      _projectsList.add(project);
      indexP = _projectsList.length - 1;
      project = _projectsList[indexP!];
      int projectId = await projectDbHelper.insert(project);
      _projectsList[indexP!].id = projectId;
      for (var index = 0; index < project.systems.length; index++) {
        _projectsList[indexP!].systems[index].projectId = projectId;
        System system = _projectsList[indexP!].systems[index];
        int systemId = await systemDbHelper.insert(system);
        for (var i = 0; i < system.items.length; i++) {
          _projectsList[indexP!].systems[index].items[i].projectId = projectId;
          _projectsList[indexP!].systems[index].items[i].systemId = systemId;
          Item item = _projectsList[indexP!].systems[index].items[i];
          await itemDbHelper.insert(item);
        }
      }
      await getAllProjects();
      indexP = _projectsList.length - 1;
      update();
    }
  }

  copySystem() async {
    if (indexP != null && indexS != null) {
      System system = _projectsList[indexP!].systems[indexS!];
      _projectsList[indexP!].systems.add(system);
      indexS = _projectsList[indexP!].systems.length - 1;
      system = _projectsList[indexP!].systems[indexS!];
      int systemId = await systemDbHelper.insert(system);
      for (var i = 0; i < system.items.length; i++) {
        _projectsList[indexP!].systems[indexS!].items[i].systemId = systemId;
        Item item = _projectsList[indexP!].systems[indexS!].items[i];
        await itemDbHelper.insert(item);
      }
      updateProjectDataDB();
      await projectDbHelper.update(_projectsList[indexP!]);
      _projectsList[indexP!] =
          await projectDbHelper.getProject(_projectsList[indexP!].id ?? -1);
      indexP = _indexP;
      indexS = _indexS;
      update();
    }
  }

  copyItem() async {
    if (indexP != null && indexS != null && indexI != null) {
      Item item = _projectsList[indexP!].systems[indexS!].items[indexI!];
      item.id = null;
      addItem(item);
    }
  }

//! Add Project / System / Item
  addProject(String name) async {
    Project project = Project(
        name: name,
        totalWeight: 0,
        totalArea: 0,
        numberOfUnits: 0,
        numberOfItems: 0,
        dateCreated: DateTime.now(),
        dateModified: DateTime.now());

    await projectDbHelper.insert(project);
    await getAllProjects();
    indexP = _projectsList.length - 1;
    update();
  }

  addSystem(String name, int qty) async {
    if (indexP != null) {
      print('add system');
      System system = System(
          quantity: qty,
          name: name,
          dateCreated: DateTime.now(),
          dateModified: DateTime.now(),
          projectId: _projectsList[indexP!].id ?? -1);
      await systemDbHelper.insert(system);
      _projectsList[indexP!].systems = await SystemDatabaseHelper.db
          .getSystemsByProject(_projectsList[indexP!]);
      await projectDbHelper.update(_projectsList[indexP!]);
      indexP = _indexP;
      indexS = _projectsList[indexP!].systems.length - 1;
      update();
    }
  }

  addItem(Item item) async {
    if (indexP != null && indexS != null) {
      item.projectId = _projectsList[indexP!].id ?? -1;
      item.systemId = _projectsList[indexP!].systems[indexS!].id ?? -1;
      await itemDbHelper.insert(item);
      _projectsList[indexP!].systems[indexS!].items = await ItemsDatabaseHelper
          .db
          .getItemsBySystem(_projectsList[indexP!].systems[indexS!]);

      updateSystemDataDB();
      updateProjectDataDB();
      await systemDbHelper.update(_projectsList[indexP!].systems[indexS!]);
      await projectDbHelper.update(_projectsList[indexP!]);
      indexP = _indexP;
      indexS = _indexS;
      indexI = _projectsList[indexP!].systems[indexS!].items.length - 1;
      update();
    }
  }

  //! Update project / system / item
  updateDBProject(Project project) async {
    if (indexP != null) {
      project.dateModified = DateTime.now();
      _projectsList[indexP!] = project;
      await projectDbHelper.update(_projectsList[indexP!]);
      update();
    }
  }

  updateDBSystem(System system) async {
    if (indexP != null && indexS != null) {
      system.dateModified = DateTime.now();
      _projectsList[indexP!].systems[indexS!] = system;
      await systemDbHelper.update(_projectsList[indexP!].systems[indexS!]);
      updateProjectDataDB();
      await projectDbHelper.update(_projectsList[indexP!]);
      update();
    }
  }

  updateDBItem(Item item) async {
    if (indexP != null && indexS != null && indexI != null) {
      item.dateModified = DateTime.now();
      _projectsList[indexP!].systems[indexS!].items[indexI!] = item;
      await itemDbHelper
          .update(_projectsList[indexP!].systems[indexS!].items[indexI!]);
      updateSystemDataDB();
      await systemDbHelper.update(_projectsList[indexP!].systems[indexS!]);
      updateProjectDataDB();
      await projectDbHelper.update(_projectsList[indexP!]);
      update();
    }
  }

//! Auto calculate Project
  void updateProjectDataDB() async {
    if (indexP != null) {
      double area = 0;
      double weight = 0;
      int numberOfItems = 0;
      int numberOfUnits = 0;
      List<System> systems = _projectsList[indexP!].systems;
      for (var index = 0; index < systems.length; index++) {
        area = area + systems[index].totalArea * systems[index].quantity;
        weight = weight + systems[index].totalWeight * systems[index].quantity;
        numberOfItems = numberOfItems + systems[index].numberOfItems;
        numberOfUnits = numberOfUnits + systems[index].quantity;
      }
      _projectsList[indexP!].totalArea = area;
      _projectsList[indexP!].totalWeight = weight;
      _projectsList[indexP!].numberOfItems = numberOfItems;
      _projectsList[indexP!].numberOfUnits = numberOfUnits;
    }
  }

  void updateSystemDataDB() async {
    if (indexP != null && indexS != null) {
      double area = 0;
      double weight = 0;
      int numberOfItems = 0;
      List<Item> items = _projectsList[indexP!].systems[indexS!].items;
      for (var index = 0; index < items.length; index++) {
        area = area + items[index].totalArea * items[index].quantity;
        weight = weight + items[index].totalWeight * items[index].quantity;
        numberOfItems = numberOfItems + items[index].quantity;
      }
      _projectsList[indexP!].systems[indexS!].totalArea = area;
      _projectsList[indexP!].systems[indexS!].totalWeight = weight;
      _projectsList[indexP!].systems[indexS!].numberOfItems = numberOfItems;
    }
  }
}

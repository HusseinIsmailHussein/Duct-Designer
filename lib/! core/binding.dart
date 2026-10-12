import 'package:duct_area_app/!!!%20view/I%20screens/1-%20duct%20items/model/duct_items_view_model.dart';
import 'package:duct_area_app/!!!%20controllers/projects_controller.dart';
import 'package:get/get.dart';
import '../!!! view/I screens/2- data tables/model/data_tables_view_model.dart';
import '../!!! controllers/item_controller.dart';
import '../!!! view/I screens/4- material settings/model/material_settings_controller.dart';
import '../!!! controllers/setting_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MaterialSettingsController(), fenix: true);
    Get.lazyPut(() => SettingsController(), fenix: true);
    Get.lazyPut(() => DataTableViewModel(), fenix: true);
    Get.lazyPut(() => MaterialSettingsController(), fenix: true);
    Get.put(ProjectsController(), permanent: true);
    Get.lazyPut(() => DuctItemsViewModel(), fenix: true);
    Get.put(ItemController(), permanent: true);
  }
}

import 'package:duct_area_app/!!%20data/themes/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '!!! controllers/google_analytics_controller.dart';
import '!!! view/I screens/0- home/dashboard_view.dart';
import '!!! view/I screens/2- data tables/model/data_tables_view_model.dart';
import '! core/binding.dart';
import '!!! view/I screens/1- duct items/model/duct_items_view_model.dart';
import '!!! view/I screens/4- material settings/model/material_settings_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  final prefs = await SharedPreferences.getInstance();
  bool showHome = prefs.getBool('showHome') ?? false;

  runApp(MyApp(
    showHome: showHome,
  ));
}

class MyApp extends StatelessWidget {
  final showHome;

  MyApp({super.key, required this.showHome});
  final GoogleAnalyticsController analyticsController =
      Get.put(GoogleAnalyticsController());

  @override
  Widget build(BuildContext context) {
    analyticsController.logAppOpenEvent();

    Get.lazyPut(() => DataTableViewModel(), fenix: true);
    Get.lazyPut(() => DuctItemsViewModel(), fenix: true);
    Get.lazyPut(() => MaterialSettingsController(), fenix: true);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      theme: getThemeData(),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: DashboardView(),
      ),
    );
  }
}

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get.dart';

class GoogleAnalyticsController extends GetxController {
  FirebaseAnalytics? analytics;

  @override
  void onInit() async {
    super.onInit();
    try {
      analytics = await FirebaseAnalytics.instance;
    } catch (e) {
      print('Error initializing FirebaseAnalytics: $e');
    }
  }

  void logAppOpenEvent() {
    if (analytics != null) {
      analytics!.logAppOpen();
    }
  }
}

import 'package:duct_area_app/!%20core/model/page_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DuctItemsViewModel extends GetxController {
  int _navigationValue = 0;
  Widget? _currentScreen;
  int get navigationValue => _navigationValue;
  Widget? get currentScreen => _currentScreen;

  void updateView(List<PageModel> pages, int index) {
    _currentScreen = pages[index].page;
    _navigationValue = index;
    update();
  }
}

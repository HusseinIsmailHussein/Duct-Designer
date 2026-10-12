import 'package:get/get.dart';

import 'setting_model.dart';

class ItemModel {
  late String number;
  SettingModel setting;
  late double value;

  ItemModel({
    required this.number,
    required this.setting,
  }) {
    value = setting.rate * (double.tryParse(number) ?? 0);
  }

  ItemModel.calculated({required this.setting, required this.value}) {
    double num = value / setting.rate;

    if (num < 10) {
      number = num.toPrecision(3).toString();
    } else if (num < 100) {
      number = num.toPrecision(2).toString();
    } else if (num < 1000) {
      number = num.toPrecision(1).toString();
    } else if (num < 99999999999) {
      number = num.toInt().toString();
    } else {
      number = '-';
    }
  }
}

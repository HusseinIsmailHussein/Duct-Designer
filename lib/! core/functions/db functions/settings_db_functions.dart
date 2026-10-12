import 'package:get_storage/get_storage.dart';

import '../../model/selected_settings_model.dart';

class SettingsDatabaseHelper {
  var storage = GetStorage();

  updateSetting(SelectedSettingsModel settings) async {
    await storage.write('settings', settings.toJson());
  }

  SelectedSettingsModel getSetting() {
    return SelectedSettingsModel.fromJson(
        storage.read('settings') ?? defaultSettings.toJson());
  }
}

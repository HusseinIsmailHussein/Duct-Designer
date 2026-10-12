import 'package:get/get.dart';
import 'Keyboard/kb_view.dart';
import 'models/item_model.dart';
import 'models/keyboad_key_model.dart';
import 'models/pd_model.dart';
import 'models/project_setting.dart';
import 'models/setting_model.dart';

class Controller extends GetxController {
  var isFormVisible = false.obs;
  var isEdited = false.obs;

  Rx<PDModel> pdModel = PDModel(
          shape: 'Rectangular',
          material: 'GI',
          projectSettings: ProjectSettings(
              airFlowUnit: 'l/min',
              widthUnit: 'inch',
              heightUnit: 'inch',
              lengthUnit: 'mt',
              velocityUnit: 'm/s',
              frictionUnit: 'Pa/m',
              pressureDropUnit: 'Pa'),
          airFlowNumber: '800',
          heightNumber: '6',
          widthNumber: '10',
          lengthNumber: '5')
      .obs;

  Rx<ItemModel> selectedItem = ItemModel(
          number: '10000',
          setting: SettingModel(
              dimension: 'Air Flow Rate', category: 'Flow Rate', unit: 'cfm'))
      .obs;

  void toggleFormVisibility(ItemModel item) {
    isFormVisible.value = true;
    isEdited.value = false;
    selectedItem.value = item;
  }

  void crossDimUpdate(String value) {
    SettingModel heightSetting = pdModel.value.projectSettings.heightSetting;
    SettingModel widthSetting = pdModel.value.projectSettings.widthSetting;

    pdModel.update((val) {
      val!.projectSettings.heightSetting = SettingModel(
          dimension: heightSetting.dimension,
          category: heightSetting.category,
          unit: value);
      val.height = ItemModel.calculated(
          setting: pdModel.value.projectSettings.heightSetting,
          value: pdModel.value.height.value);
      val.projectSettings.widthSetting = SettingModel(
          dimension: widthSetting.dimension,
          category: widthSetting.category,
          unit: value);
      val.width = ItemModel.calculated(
          setting: pdModel.value.projectSettings.widthSetting,
          value: pdModel.value.width.value);
    });
  }

  void lengthDimUpdate(String value) {
    SettingModel lengthSetting = pdModel.value.projectSettings.lengthSetting;

    pdModel.update((val) {
      val!.projectSettings.lengthSetting = SettingModel(
          dimension: lengthSetting.dimension,
          category: lengthSetting.category,
          unit: value);
      val.length = ItemModel.calculated(
          setting: pdModel.value.projectSettings.lengthSetting,
          value: pdModel.value.length.value);
    });
  }

  void airFlowDimUpdate(String value) {
    SettingModel airflowSetting = pdModel.value.projectSettings.airFlowSetting;

    pdModel.update((val) {
      val!.projectSettings.airFlowSetting = SettingModel(
          dimension: airflowSetting.dimension,
          category: airflowSetting.category,
          unit: value);
      val.airFlow = ItemModel.calculated(
          setting: pdModel.value.projectSettings.airFlowSetting,
          value: pdModel.value.airFlow.value);
    });
  }

  void velocityDimUpdate(String value) {
    SettingModel velocitySetting =
        pdModel.value.projectSettings.velocitySetting;

    pdModel.update((val) {
      val!.projectSettings.velocitySetting = SettingModel(
          dimension: velocitySetting.dimension,
          category: velocitySetting.category,
          unit: value);
      val.velocity = ItemModel.calculated(
          setting: pdModel.value.projectSettings.velocitySetting,
          value: pdModel.value.velocity.value);
    });
  }

  void frictionDimUpdate(String value) {
    SettingModel frictionSetting =
        pdModel.value.projectSettings.frictionSetting;

    pdModel.update((val) {
      val!.projectSettings.frictionSetting = SettingModel(
          dimension: frictionSetting.dimension,
          category: frictionSetting.category,
          unit: value);
      val.friction = ItemModel.calculated(
          setting: pdModel.value.projectSettings.frictionSetting,
          value: pdModel.value.friction.value);
    });
  }

  void pressureDimUpdate(String value) {
    SettingModel pressureDropSetting =
        pdModel.value.projectSettings.pressureDropSetting;

    pdModel.update((val) {
      val!.projectSettings.pressureDropSetting = SettingModel(
          dimension: pressureDropSetting.dimension,
          category: pressureDropSetting.category,
          unit: value);
      val.pressureDrop = ItemModel.calculated(
          setting: pdModel.value.projectSettings.pressureDropSetting,
          value: pdModel.value.pressureDrop.value);
    });
  }

  void onBtnTap(String value) {
    if (value == KeyboardBtn.done) {
      isFormVisible.value = false;
    } else {
      String text = '';

      if (isEdited.value == true) {
        text = selectedItem.value.number;
      }

      text = KeyboardBtn().onBtnTap(text, value);
      updateNumberValue(text);
      updateItem();
      isEdited.value = true;
    }
  }

  void updateAirFlow(String value) {
    PDModel project = pdModel.value;

    pdModel.value = PDModel(
        shape: project.shape,
        material: project.material,
        projectSettings: project.projectSettings,
        airFlowNumber: value,
        heightNumber: project.height.number,
        widthNumber: project.width.number,
        lengthNumber: project.length.number);
  }

  void updateItem() {
    ItemModel item = selectedItem.value;
    PDModel project = pdModel.value;

    if (item.setting.dimension == 'Air Flow Rate') {
      pdModel.value = PDModel(
          shape: project.shape,
          material: project.material,
          projectSettings: project.projectSettings,
          airFlowNumber: item.number,
          heightNumber: project.height.number,
          widthNumber: project.width.number,
          lengthNumber: project.length.number);
    } else if (item.setting.dimension == 'Width') {
      pdModel.value = PDModel(
          shape: project.shape,
          material: project.material,
          projectSettings: project.projectSettings,
          airFlowNumber: project.airFlow.number,
          heightNumber: project.height.number,
          widthNumber: item.number,
          lengthNumber: project.length.number);
    } else if (item.setting.dimension == 'Length') {
      pdModel.value = PDModel(
          shape: project.shape,
          material: project.material,
          projectSettings: project.projectSettings,
          airFlowNumber: project.airFlow.number,
          heightNumber: project.height.number,
          widthNumber: project.width.number,
          lengthNumber: item.number);
    } else if (item.setting.dimension == 'Height') {
      pdModel.value = PDModel(
          shape: project.shape,
          material: project.material,
          projectSettings: project.projectSettings,
          airFlowNumber: project.airFlow.number,
          heightNumber: item.number,
          widthNumber: project.width.number,
          lengthNumber: project.length.number);
    }
  }

  void backSpace() {
    String text = selectedItem.value.number;
    if (text.isNotEmpty) {
      updateNumberValue(text.substring(0, text.length - 1));
    } else {
      updateNumberValue('');
    }
  }

  void updateNumberValue(String value) {
    selectedItem.update((val) {
      val!.number = value;
    });
  }

  void appendDot() {
    String text = selectedItem.value.number;
    if (text.isEmpty) {
      updateNumberValue('0.');
    } else {
      if (text.contains('.')) {
      } else {
        updateNumberValue('$text.');
      }
    }
  }

  void appendValue(String value) {
    String text = selectedItem.value.number;

    if (text.isEmpty || (double.tryParse(text) == 0 && !(text.contains('.')))) {
      updateNumberValue(value);
    } else {
      updateNumberValue(text + value);
    }
  }

  List<String> getDimensionsList(String query) {
    // ignore: avoid_function_literals_in_foreach_calls
    List<String> filteredList = dimensionsList
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return filteredList;
  }
}

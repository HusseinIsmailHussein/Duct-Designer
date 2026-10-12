import 'package:duct_area_app/!!!%20controllers/projects_controller.dart';
import 'package:duct_area_app/!%20core/model/item_model.dart';
import 'package:duct_area_app/!!!%20view/I%20screens/1-%20duct%20items/duct_item_details.dart';
import 'package:duct_area_app/!!!%20view/I%20screens/1-%20duct%20items/duct_items_view.dart';
import 'package:duct_area_app/!!!%20view/II%20widgets/action%20cards/action_card_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../!!! controllers/item_controller.dart';
import '../../../!! data/constant/duct_items_list.dart';

class ItemsActionsBar extends StatelessWidget {
  ItemsActionsBar({super.key});
  final ProjectsController controller = Get.find();
  ItemController itemController = Get.find();

  @override
  Widget build(BuildContext context) {
    Item? item = controller.selectedItem;
    bool isNotBlank = item != null;

    return ActionCardCustom(
      isNotBlank: isNotBlank,
      color: Colors.white,
      summary: '',
      name: 'Name',
      type: 'Unit',
      addAction: () {
        controller.selectedItem = null;

        Get.to(DuctItemsView());
      },
      editAction: () {
        itemController.selectedDuct = ductsList
            .firstWhere((duct) => duct.id == controller.selectedItem!.ductId);
        Get.to(() => DuctItemsDetails());
      },
      copyAction: () => controller.copyItem(),
      deleteAction: () => controller.deleteItem(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Components/dim_btn.dart';
import 'Components/unit_dropdown.dart';
import 'Keyboard/kb_view.dart';
import 'controller.dart';
import 'models/pd_model.dart';

class DuctSizer extends StatelessWidget {
  final Controller controller = Get.put(Controller());

  DuctSizer({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Stack(
              children: [
                MainScreen(),
                KeyboardScreen(),
              ],
            ),
          ),
          // AbsManager().admobBanner,
        ],
      ),
    );
  }
}

//! Main Screen
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final Controller controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    return Center(child: Obx(() {
      PDModel pdModel = controller.pdModel.value;
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DimButton(
                  item: pdModel.airFlow,
                  onTap: (item) {
                    controller.toggleFormVisibility(item);
                  },
                  selectedItem: controller.selectedItem.value,
                  isEditable: true,
                ),
                UnitDropDown(
                    item: pdModel.airFlow,
                    onToggle: (value) {
                      controller.airFlowDimUpdate(value);
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DimButton(
                  item: pdModel.height,
                  onTap: (item) {
                    controller.toggleFormVisibility(item);
                  },
                  selectedItem: controller.selectedItem.value,
                  isEditable: true,
                ),
                UnitDropDown(
                    item: pdModel.height,
                    onToggle: (value) {
                      controller.crossDimUpdate(value);
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DimButton(
                  item: pdModel.width,
                  onTap: (item) {
                    controller.toggleFormVisibility(item);
                  },
                  selectedItem: controller.selectedItem.value,
                  isEditable: true,
                ),
                UnitDropDown(
                    item: pdModel.height,
                    onToggle: (value) {
                      controller.crossDimUpdate(value);
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DimButton(
                  item: pdModel.length,
                  onTap: (item) {
                    controller.toggleFormVisibility(item);
                  },
                  selectedItem: controller.selectedItem.value,
                  isEditable: true,
                ),
                UnitDropDown(
                    item: pdModel.length,
                    onToggle: (value) {
                      controller.lengthDimUpdate(value);
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DimButton(
                  item: pdModel.velocity,
                  onTap: (item) {
                    controller.toggleFormVisibility(item);
                  },
                  selectedItem: controller.selectedItem.value,
                  isEditable: false,
                ),
                UnitDropDown(
                    item: pdModel.velocity,
                    onToggle: (value) {
                      controller.velocityDimUpdate(value);
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DimButton(
                  item: pdModel.friction,
                  onTap: (item) {
                    controller.toggleFormVisibility(item);
                  },
                  selectedItem: controller.selectedItem.value,
                  isEditable: false,
                ),
                UnitDropDown(
                    item: pdModel.friction,
                    onToggle: (value) {
                      controller.frictionDimUpdate(value);
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DimButton(
                  item: pdModel.pressureDrop,
                  onTap: (item) {
                    controller.toggleFormVisibility(item);
                  },
                  selectedItem: controller.selectedItem.value,
                  isEditable: false,
                ),
                UnitDropDown(
                    item: pdModel.pressureDrop,
                    onToggle: (value) {
                      controller.pressureDimUpdate(value);
                    }),
              ],
            ),
          ],
        ),
      );
    }));
  }
}

//! keyboard Screen
class KeyboardScreen extends StatelessWidget {
  final Controller controller = Get.find<Controller>();

  KeyboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedPositioned(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        bottom: controller.isFormVisible.value
            ? 0
            : -MediaQuery.of(context).size.height / 2,
        left: 0,
        right: 0,
        child: GestureDetector(
          onTap: () =>
              controller.toggleFormVisibility(controller.selectedItem.value),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Center(
              child: KBView(),
            ),
          ),
        ),
      );
    });
  }
}

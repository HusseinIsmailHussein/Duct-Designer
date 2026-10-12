import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/keyboad_key_model.dart';
import '../controller.dart';

List<String> dimensionsList = [];
List<String> unitsList = [];

class KBView extends StatelessWidget {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Wrap(
                children: KeyboardBtn.buttonValues
                    .map(
                      (value) => SizedBox(
                        width: screenSize.width / 4,
                        height: screenSize.height / 12,
                        child: buildButton(value),
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//! Keyboard Button
Widget buildButton(value) {
  final Controller controller = Get.find<Controller>();

  return Padding(
    padding: const EdgeInsets.all(1),
    child: Material(
      color: KeyboardBtn().getBtnColor(value),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => controller.onBtnTap(value),
        child: Center(
          child: Text(
            value,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    ),
  );
}

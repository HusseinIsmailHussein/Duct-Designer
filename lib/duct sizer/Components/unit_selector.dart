import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../models/item_model.dart';

class UnitSelector extends StatelessWidget {
  final double height;
  final Color color;
  final ItemModel item;
  final Function(String) onToggle;

  UnitSelector(
      {Key? key,
      required this.item,
      required this.onToggle,
      this.height = 80,
      this.color = Colors.orange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        child: ToggleSwitch(
          isVertical: true,
          fontSize: 12,
          minWidth: 60,
          initialLabelIndex:
              item.setting.dimensionsList.indexOf(item.setting.unit),
          labels: item.setting.dimensionsList,
          onToggle: (index) {
            onToggle(item.setting.dimensionsList[index ?? 1]);
          },
        ));
  }
}

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/item_model.dart';

class UnitDropDown extends StatelessWidget {
  final double height;
  final ItemModel item;
  final Function(String) onToggle;

  const UnitDropDown(
      {super.key,
      required this.item,
      required this.onToggle,
      this.height = 40});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: 120,
        child: CustomDropdown(
          decoration: CustomDropdownDecoration(
              expandedFillColor: Colors.white,
              closedFillColor: Colors.white,
              closedBorderRadius: BorderRadius.circular(10)),
          hintText: item.setting.unit,
          closedHeaderPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemsListPadding: const EdgeInsets.symmetric(horizontal: 10),
          expandedHeaderPadding: const EdgeInsets.symmetric(horizontal: 10),
          listItemPadding: EdgeInsets.zero,
          items: item.setting.dimensionsList,
          initialItem: item.setting.unit,
          onChanged: (value) {
            onToggle(value!);
          },
        ));
  }
}

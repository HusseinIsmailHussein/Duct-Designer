import 'package:flutter/material.dart';

import '../models/item_model.dart';

class ObscuredTextFieldSample extends StatelessWidget {
  final ItemModel item;
  final Function(String) onToggle;

  const ObscuredTextFieldSample(
      {Key? key, required this.item, required this.onToggle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: item.number);

    return SizedBox(
      width: 150,
      child: TextField(
        controller: controller, // Setting the controller with initial value
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.number,
        onChanged: (value) => {onToggle(value)},
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Air Flow Rate',
          enabled: true,
        ),
      ),
    );
  }
}

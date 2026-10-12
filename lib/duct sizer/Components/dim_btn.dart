import 'package:flutter/material.dart';

import '../models/item_model.dart';

class DimButton extends StatelessWidget {
  final double height;
  final Color color;
  final ItemModel item;
  final ItemModel selectedItem;
  final bool isEditable;
  final Function(ItemModel) onTap;

  const DimButton(
      {Key? key,
      required this.item,
      required this.onTap,
      required this.isEditable,
      required this.selectedItem,
      this.height = 50,
      this.color = Colors.orange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          isEditable ? onTap(item) : {};
          print('taped');
        },
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  item.setting.dimension,
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                width: 100,
                height: 40,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(10), // Adjust the radius as needed
                  border: Border.all(
                      color: item.setting.dimension ==
                              selectedItem.setting.dimension
                          ? Colors.red
                          : Colors.black,
                      width: 2), // Add border properties
                  color: isEditable ? Colors.white : Colors.grey,
                ),
                child: Center(
                  child: Text(
                    item.number,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: item.setting.dimension ==
                                selectedItem.setting.dimension
                            ? FontWeight.bold
                            : FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

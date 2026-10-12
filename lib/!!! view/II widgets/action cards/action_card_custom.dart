import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionCardCustom extends StatelessWidget {
  const ActionCardCustom(
      {Key? key,
      required this.isNotBlank,
      required this.color,
      required this.summary,
      required this.name,
      required this.type,
      required this.addAction,
      required this.editAction,
      required this.copyAction,
      required this.deleteAction,
      required})
      : super(key: key);
  final bool isNotBlank;
  final Color color;
  final String summary;
  final String name;
  final String type;
  final Function editAction;
  final Function copyAction;
  final Function deleteAction;
  final Function addAction;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        color: color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  addAction();
                },
                icon: const Icon(
                  Icons.add,
                )),
            IconButton(
                onPressed: () {
                  if (isNotBlank) {
                    editAction();
                  } else {
                    Get.snackbar('No $type', ' PLease select $type to edit it');
                  }
                },
                icon: const Icon(
                  Icons.edit,
                )),
            IconButton(
              onPressed: () {
                if (isNotBlank) {
                  Get.snackbar('$type copied', '$type $name has been copied');
                  copyAction();
                } else {
                  Get.snackbar('No $type', ' PLease select $type to copy it');
                }
              },
              icon: const Icon(
                Icons.copy,
              ),
            ),
            IconButton(
                onPressed: () {
                  if (isNotBlank) {
                    Get.snackbar(
                        '$type Deleted', '$type $name has been deleted');
                    deleteAction();
                  } else {
                    Get.snackbar(
                        'No $type', ' PLease select $type to deleted it');
                  }
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ],
        ),
      ),
    );
  }
}

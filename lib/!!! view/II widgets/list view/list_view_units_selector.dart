import 'package:duct_area_app/!!%20data/themes/color/app_colors.dart';
import 'package:duct_area_app/!!%20data/themes/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListViewUnitsSelector extends StatelessWidget {
  const ListViewUnitsSelector({
    Key? key,
    required this.text,
    required this.list,
    required this.onTap,
    required this.selected,
  }) : super(key: key);
  final String text;
  final List list;
  final Function onTap;
  final int selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 80,
              child: Text(
                text,
                style: TextStyles.bodyBold,
                textAlign: TextAlign.left,
              )),
          SizedBox(
            height: 30,
            width: Get.width - 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: ((context, index) => Padding(
                      padding: const EdgeInsets.only(right: 3, left: 3),
                      child: GestureDetector(
                        onTap: () {
                          onTap(index);
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: AppColors.primaryColor),
                              color: (index == selected)
                                  ? AppColors.primaryColor
                                  : AppColors.backgroundColor),
                          constraints: const BoxConstraints(
                            minHeight: 30,
                            maxHeight: 50,
                            minWidth: 60,
                          ),
                          child: Text(
                            list[index].name,
                            style: TextStyle(
                                color: (index == selected)
                                    ? AppColors.backgroundColor
                                    : AppColors.primaryColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ))),
          ),
        ],
      ),
    );
  }
}

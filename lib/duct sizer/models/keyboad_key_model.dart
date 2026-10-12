import 'package:flutter/material.dart';

class KeyboardBtn {
  static const String del = "C";
  static const String back = "<";
  static const String space = " ";
  static const String cancel = "Cancel";
  static const String done = "Done";

  static const String n0 = "0";
  static const String n1 = "1";
  static const String n2 = "2";
  static const String n3 = "3";
  static const String n4 = "4";
  static const String n5 = "5";
  static const String n6 = "6";
  static const String n7 = "7";
  static const String n8 = "8";
  static const String n9 = "9";
  static const String dot = ".";

  static const List<String> buttonValues = [
    n1,
    n2,
    n3,
    del,
    n4,
    n5,
    n6,
    back,
    n7,
    n8,
    n9,
    space,
    space,
    n0,
    dot,
    done
  ];

  Color getBtnColor(value) {
    return [cancel].contains(value)
        ? Colors.redAccent
        : [done].contains(value)
            ? Colors.blueGrey
            : [space].contains(value)
                ? Colors.transparent
                : Colors.white70;
  }

  String backSpace(String text) {
    if (text.isNotEmpty) {
      return text.substring(0, text.length - 1);
    } else {
      return '';
    }
  }

  String appendDot(String text) {
    if (text.isEmpty) {
      return '0.';
    } else {
      if (text.contains('.')) {
        return text;
      } else {
        return '$text.';
      }
    }
  }

  String appendValue(String text, String value) {
    if (text.isEmpty || (double.tryParse(text) == 0 && !(text.contains('.')))) {
      return value;
    } else {
      return text + value;
    }
  }

  String onBtnTap(String text, String value) {
    if (int.tryParse(value) == null) {
      if (value == KeyboardBtn.dot) {
        return appendDot(text);
      }
      if (value == KeyboardBtn.del) {
        return '';
      }
      if (value == KeyboardBtn.back) {
        return backSpace(text);
      } else {
        return text;
      }
    } else {
      return appendValue(text, value);
    }
  }
}

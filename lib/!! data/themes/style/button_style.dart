import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyle cancel = TextButton.styleFrom(
      backgroundColor: Colors.grey.shade300,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)));

  static ButtonStyle confirm = TextButton.styleFrom(
      backgroundColor: Colors.blue,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)));
}

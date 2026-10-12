import 'package:flutter/material.dart';

class TextCustomx extends StatelessWidget {
  const TextCustomx(
      {super.key,
      this.text = '',
      this.fontSize = 14,
      this.color = Colors.black,
      this.alignment = Alignment.topLeft,
      this.height = 1});
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: fontSize, height: height),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  const DrawerItem(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          icon,
          color: Colors.red,
          size: 25,
        ),
        title: Text(text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        onTap: () => onTap());
  }
}

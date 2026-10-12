import 'package:flutter/material.dart';

class SectionA extends StatelessWidget {
  final String headline;
  final Widget body;
  const SectionA({super.key, required this.headline, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            headline,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          body
        ],
      ),
    );
  }
}

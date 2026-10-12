import 'package:flutter/material.dart';

class ScrollViewWidget extends StatelessWidget {
  final Widget child;

  const ScrollViewWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: child,
        ),
      );
}

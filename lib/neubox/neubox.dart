import 'package:flutter/material.dart';

class neubox extends StatelessWidget {
  final child;
  final double? height;
  final double? width;
  final boxShadow;
  final List<Color> theme;
  final border;
  final shape;
  final borderRadius;
  neubox(
      {super.key,
      required this.child,
      this.height,
      this.width,
      this.boxShadow,
      this.theme = const [Colors.grey, Colors.grey],
      this.border,
      this.shape = BoxShape.rectangle, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(8),
      child: Center(child: child),
      decoration: BoxDecoration(
          shape: shape,
          border: border,
          gradient: LinearGradient(colors: theme),
          borderRadius: borderRadius,
          boxShadow: boxShadow),
    );
  }
}

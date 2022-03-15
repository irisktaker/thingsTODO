import 'package:flutter/material.dart';

CircleAvatar buildCustomCircle({
  required Color color,
  double? radius = 10,
  Widget? child,
}) {
  return CircleAvatar(
    backgroundColor: color,
    radius: radius,
    child: child,
  );
}

import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class UtilsShadows {
  static BoxShadow main = const BoxShadow(color: Colors.grey, blurRadius: 0.5);
  static BoxShadow secondary = const BoxShadow(
    blurRadius: 1,
    color: Colors.black12,
    offset: Offset(2, 2),
    spreadRadius: 2,
  );
}

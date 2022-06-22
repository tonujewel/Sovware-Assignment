import 'package:flutter/material.dart';

class AppStyle {
  static const Color backgroundColor = Color(0xffdfe6e9);

  static const hintColor = Color(0xFF7F859E);

  static final List<BoxShadow> boxShadow = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.4),
      blurRadius: 4,
      offset: const Offset(4, 4),
    ),
  ];
}

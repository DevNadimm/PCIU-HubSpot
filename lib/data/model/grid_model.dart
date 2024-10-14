import 'package:flutter/material.dart';

class GridModel {
  final Icon iconWidget;
  final Widget widget;
  final IconData icon;
  final String title;

  GridModel(this.iconWidget, {
    required this.widget,
    required this.icon,
    required this.title,
  });
}

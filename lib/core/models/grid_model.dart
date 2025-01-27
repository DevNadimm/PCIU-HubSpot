import 'package:flutter/material.dart';

class HomeGridModel {
  final Widget widget;
  final String imgPath;
  final String title;

  HomeGridModel({
    required this.widget,
    required this.imgPath,
    required this.title,
  });
}

class LinkGridModel {
  final VoidCallback onTap;
  final String imgPath;
  final String title;

  LinkGridModel({
    required this.onTap,
    required this.imgPath,
    required this.title,
  });
}


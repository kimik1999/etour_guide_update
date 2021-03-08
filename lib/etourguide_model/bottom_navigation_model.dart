import 'package:flutter/material.dart';
class AnimatedItem {
  String title;
  IconData icon;
  Color iconColor;
  AnimatedItem({this.title, this.icon, this.iconColor});

  String get Title{
    return title;
  }
  IconData get Icon{
    return icon;
  }
  Color get IconColor{
    return iconColor;
  }
}
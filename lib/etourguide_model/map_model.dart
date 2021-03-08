import 'package:flutter/cupertino.dart';

class Map extends ChangeNotifier{
  bool hasTouch = false;
  bool get hasTouched => hasTouched;
  set hasTouched(value) {
    hasTouched = value;
    notifyListeners();
  }
}
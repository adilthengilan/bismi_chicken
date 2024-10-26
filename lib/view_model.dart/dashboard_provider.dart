import 'package:flutter/material.dart';

class DashProvider extends ChangeNotifier {
  int navigationindex = 0;

  void setNavigationIndex(index) {
    navigationindex = index;
    notifyListeners();
  }
}

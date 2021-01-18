import 'package:flutter/material.dart';

class ShoeSizeProvider with ChangeNotifier {
  int _currentIndex = -1;

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  List<double> get shoeSizes => [7, 7.5, 8, 8.5, 9, 9.5];
}
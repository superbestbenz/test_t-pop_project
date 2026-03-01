import 'package:flutter/material.dart' show ChangeNotifier;

class PackageScreenProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class CheckboxNotifier with ChangeNotifier {
  bool _value = true;
  bool get getValue => _value;

  void toggle() {
    _value = !_value;
    notifyListeners();
  }
}

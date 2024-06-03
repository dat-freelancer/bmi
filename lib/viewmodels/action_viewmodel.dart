import 'package:flutter/material.dart';

class ActionViewModel<V extends num> extends ChangeNotifier {
  V _value;
  final String title;

  ActionViewModel({
    required this.title,
    required V value,
  }) : _value = value;

  void increment() {
    _value = (_value + 1) as V;
    notifyListeners();
  }

  void decrement() {
    _value = (_value - 1) as V;
    notifyListeners();
  }

  String get valueString => _value.toStringAsFixed(0);

  V get value => _value;
}

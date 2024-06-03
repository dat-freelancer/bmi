import 'package:bmi/domain/unit.dart';
import 'package:flutter/material.dart';

class HeightViewModel extends ChangeNotifier {
  final String title;
  final double minValue;
  final double maxValue;
  double value;
  HeightMetric unit;

  HeightViewModel({
    this.title = "HEIGHT",
    this.unit = HeightMetric.cm,
    this.minValue = 20,
    this.maxValue = 200,
  }) : value = minValue;

  void setMetric(HeightMetric unit) {
    this.unit = unit;
    notifyListeners();
  }

  void setValue(double value) {
    this.value = value;
    notifyListeners();
  }

  String get unitTitle {
    switch (unit) {
      case HeightMetric.cm:
        return "CM";
      case HeightMetric.m:
        return "M";
    }
  }
}

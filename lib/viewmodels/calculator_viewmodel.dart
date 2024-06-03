import 'package:bmi/domain/bmi_calculator.dart';
import 'package:flutter/material.dart';

class CalculatorViewModel extends ChangeNotifier {
  final BmiCalculator service;

  CalculatorViewModel({
    required this.service,
  });

  void calculate() {}
}

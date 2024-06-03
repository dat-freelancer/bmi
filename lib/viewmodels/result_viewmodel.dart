import 'package:bmi/components/bmi_index_table.dart';
import 'package:bmi/domain/bmi_calculator.dart';
import 'package:bmi/domain/bmi_classification.dart';
import 'package:bmi/domain/type.dart';
import 'package:flutter/material.dart';

class ResultInputInfo {
  double height;
  double weight;
  int age;

  ResultInputInfo({
    required this.weight,
    required this.height,
    required this.age,
  });
}

class ResultViewModel extends ChangeNotifier {
  ResultInputInfo inputInfo;
  BmiCalculator calculator;
  BmiClassification classification;

  ResultViewModel({
    required this.inputInfo,
    required this.calculator,
    required this.classification,
  });

  String get heightValueText => inputInfo.height.toStringAsFixed(0);
  String get heightTitle => 'HEIGHT';
  String get weightValueText => inputInfo.weight.toStringAsFixed(0);
  String get weightTitle => 'WEIGHT';
  String get ageValueText => inputInfo.age.toString();
  String get ageTitle => 'AGE';

  String get heightUnitText => ' cm';
  String get weightUnitText => ' kg';

  double get _bmi =>
      calculator.calculate(height: inputInfo.height, weight: inputInfo.weight);

  BmiType get _type => classification.classificate(bmi: _bmi);

  String get bmiText => _bmi.toStringAsFixed(1);

  String get bmiType {
    String type;
    switch (_type) {
      case BmiType.underweight:
        type = "Underweight";
        break;
      case BmiType.normal:
        type = "Normal";
        break;
      case BmiType.overweight:
        type = "Overweight";
        break;
      case BmiType.obeseI:
      case BmiType.obeseII:
      case BmiType.obeseIII:
        type = "Obese";
    }
    return type.toUpperCase();
  }

  Color get bmiColor {
    switch (_type) {
      case BmiType.underweight:
        return const Color(0xffd38888);
      case BmiType.normal:
        return const Color(0xff008137);
      case BmiType.overweight:
        return const Color(0xffffe400);
      case BmiType.obeseI:
      case BmiType.obeseII:
      case BmiType.obeseIII:
        return const Color(0xffbc2020);
    }
  }

  BMIRowInfo _infoFromType(BmiType type) {
    switch (type) {
      case BmiType.underweight:
        return BMIRowInfo(
            type: 'Underweight',
            range: '< 18.5',
            isSelected: _type == BmiType.underweight);
      case BmiType.normal:
        return BMIRowInfo(
            type: 'Normal',
            range: '19 - 25',
            isSelected: _type == BmiType.normal);
      case BmiType.overweight:
        return BMIRowInfo(
            type: 'Overweight',
            range: '25 - 30',
            isSelected: _type == BmiType.overweight);
      case BmiType.obeseI:
        return BMIRowInfo(
            type: 'Obese Class-I',
            range: '30 - 35',
            isSelected: _type == BmiType.obeseI);
      case BmiType.obeseII:
        return BMIRowInfo(
            type: 'Obese Class-II',
            range: '35 - 40',
            isSelected: _type == BmiType.obeseII);
      case BmiType.obeseIII:
        return BMIRowInfo(
            type: 'Obese Class-III',
            range: '> 40',
            isSelected: _type == BmiType.obeseIII);
    }
  }

  List<BMIRowInfo> get bmiTableRows => bmiTypes.map((e) {
        return _infoFromType(e);
      }).toList();
}

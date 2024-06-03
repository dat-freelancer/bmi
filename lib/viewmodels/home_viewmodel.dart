import 'package:bmi/viewmodels/action_viewmodel.dart';
import 'package:bmi/viewmodels/gender_viewmodel.dart';
import 'package:bmi/viewmodels/height_viewmodel.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final GenderViewModel genderViewModel;
  final HeightViewModel heightViewModel;
  final ActionViewModel<double> weightViewModel;
  final ActionViewModel<int> ageViewModel;

  HomeViewModel({
    required this.genderViewModel,
    required this.ageViewModel,
    required this.heightViewModel,
    required this.weightViewModel,
  }) {
    _setupListeners();
  }

  void _setupListeners() {
    genderViewModel.addListener(notifyListeners);
    heightViewModel.addListener(notifyListeners);
    weightViewModel.addListener(notifyListeners);
    ageViewModel.addListener(notifyListeners);
  }

  @override
  void dispose() {
    genderViewModel.removeListener(notifyListeners);
    heightViewModel.removeListener(notifyListeners);
    weightViewModel.removeListener(notifyListeners);
    ageViewModel.removeListener(notifyListeners);
    super.dispose();
  }

  double calculate() {
    double height = heightViewModel.value / 100;
    double weight = weightViewModel.value;
    print("Height: $height");
    print("Weight: $weight");
    print("BMI: ${weight / (height * height)}");

    return weight / (height * height);
  }
}

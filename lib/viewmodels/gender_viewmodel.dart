import 'package:bmi/theme.dart';
import 'package:flutter/material.dart';
import '../domain/gender.dart';

class GenderViewModel extends ChangeNotifier {
  Gender? gender;
  Color femaleColor = AppColor.appBarBackground;
  Color maleColor = AppColor.appBarBackground;
  final String femaleIcon;
  final String femaleTitle;
  final String maleIcon;
  final String maleTitle;

  GenderViewModel({
    this.gender,
    this.femaleColor = AppColor.appBarBackground,
    this.maleColor = AppColor.appBarBackground,
    this.femaleIcon = "images/female.png",
    this.maleIcon = "images/male.png",
    this.femaleTitle = "FEMALE",
    this.maleTitle = "MALE",
  });

  void setGender(Gender gender) {
    this.gender = gender;
    _changeSelectedGenderColor();
    notifyListeners();
  }

  void _changeSelectedGenderColor() {
    if (gender == null) {
      femaleColor = AppColor.appBarBackground;
      maleColor = AppColor.appBarBackground;
    } else {
      switch (gender!) {
        case Gender.female:
          femaleColor = AppColor.selected;
          maleColor = AppColor.appBarBackground;
          break;
        case Gender.male:
          maleColor = AppColor.selected;
          femaleColor = AppColor.appBarBackground;
          break;
      }
    }
  }

  bool get isFemaleSelected => gender == Gender.female;

  bool get isMaleSelected => gender == Gender.male;
}

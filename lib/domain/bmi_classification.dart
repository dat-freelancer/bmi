import 'package:bmi/domain/type.dart';

class BmiClassification {
  BmiType classificate({required double bmi}) {
    if (bmi < 18.5) {
      return BmiType.underweight;
    } else if (bmi >= 18.5 && bmi < 25) {
      return BmiType.normal;
    } else if (bmi >= 25 && bmi < 30) {
      return BmiType.overweight;
    } else if (bmi >= 30 && bmi < 35) {
      return BmiType.obeseI;
    } else if (bmi >= 25 && bmi < 40) {
      return BmiType.obeseII;
    } else {
      return BmiType.obeseIII;
    }
  }
}

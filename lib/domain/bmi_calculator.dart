import 'package:bmi/domain/unit.dart';

class BmiCalculator {
  double calculate({
    required double height,
    HeightMetric heightMetric = HeightMetric.m,
    required double weight,
    WeightMetric weightMetric = WeightMetric.kg,
  }) {
    double heightToM = height / 100;
    return weight / (heightToM * heightToM);
  }
}

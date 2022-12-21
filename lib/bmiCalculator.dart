import 'dart:math';

class BMICalculator {
  final weight;
  final height;

  double _bmi = 0;

  BMICalculator({required this.height, required this.weight});

  String findBMI() {
    _bmi = weight / pow(height / 100.0, 2);
    return _bmi.toStringAsFixed(1);
  }

  String findCategory() {
    print(_bmi);
    if (_bmi >= 25.0)
      return 'OVERWEIGHT';
    else if (_bmi >= 18.5)
      return 'HEALTHY';
    else
      return 'UNDERWEIGHT';
  }

  String getDescription() {
    print(_bmi);
    if (_bmi >= 25.0)
      return 'You should exercise more';
    else if (_bmi >= 18.5)
      return 'You are quite fit';
    else
      return 'You should eat more food';
  }
}

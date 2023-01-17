import 'dart:math';

class BMIBrain {
  final int height;
  final int weight;
  double bmi = 0;

  BMIBrain(this.height, this.weight);

  String calculateBMI() {
    bmi = (weight / pow(height / 100, 2));
    return bmi.toStringAsFixed(2);
  }

  String getResult() {
    if (bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getMessage() {
    if (bmi >= 25) {
      return 'You have a higher than normal body weight. Try to EXERCISE more!';
    } else if (bmi > 18.5) {
      return 'Your body weight is normal. Keep it up. GOOD JOB!';
    } else {
      return 'You have a lower than normal body weight. You can EAT a bit more!';
    }
  }
}
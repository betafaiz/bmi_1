import 'package:bmi_1/constants/constant.dart';

class BmiCalculator {
  int? height; //in cm
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;

  BmiCalculator({required this.height, required this.weight});
  BmiCalculator.fromBmiValue(this.bmi);

  double calculateBmi() {
    double heightInMeter = height! / 100;
    // final h = pow(heightInMeter, 2);
    bmi = weight! / (heightInMeter * heightInMeter);
    return bmi!;
  }

  String determineBmiCategory() {
    String category = "";
    if (bmi! < 16.0) {
      category = underweightSevere;
    } else if (bmi! < 17.0) {
      category = underweightModerate;
    } else if (bmi! < 18.5) {
      category = underweightMild;
    } else if (bmi! < 25.0) {
      category = normal;
    } else if (bmi! < 30.0) {
      category = overweight;
    } else if (bmi! < 35.0) {
      category = obeseI;
    } else if (bmi! < 40.0) {
      category = obeseII;
    } else {
      category = obeseIII;
    }

    bmiCategory = category;
    return category;
  }

  String getDescription() {
    String desc = "";

    switch (bmiCategory!) {
      case underweightSevere:
        desc = "Info of underweight Severe";
        break;
      case underweightModerate:
        desc = "Info of underweight Moderate";
        break;
      case underweightMild:
        desc = "Info of underweight Mild";
        break;
      case normal:
        desc = "Info of normal";
        break;
      case overweight:
        desc = "Info of overweight";
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        desc = "Info of obese";
        break;
      default:
    }

    bmiDescription = desc;
    return desc;
  }
}

// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:bmi_1/helpers/bmi_calculator.dart';
import 'package:bmi_1/views/bmi_data_screen.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({Key? key, required this.bmi}) : super(key: key);
  final double bmi;

  @override
  Widget build(BuildContext context) {
    final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(bmi);
    bmiCalculator.determineBmiCategory();
    bmiCalculator.getDescription();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Perhitungan BMI'),
      ),
      body: Column(
        children: [
          const Expanded(
              child: Center(
            child: Text(
              'Hasil Perhitungan',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )),
          Expanded(
              flex: 5,
              child: Row(
                children: [
                  Expanded(
                    child: BmiCard(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              bmiCalculator.bmiCategory ?? "",
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              bmi.toStringAsFixed(1),
                              style: const TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              bmiCalculator.bmiDescription ?? "",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 80,
              color: const Color(0xffffba00),
              child: const Center(
                child: Text(
                  'Hitung ulang',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

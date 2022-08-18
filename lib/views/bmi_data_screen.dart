import 'package:flutter/material.dart';
import 'package:bmi_1/helpers/bmi_calculator.dart';
import 'package:bmi_1/views/bmi_result_screen.dart';
import 'package:bmi_1/constants/constant.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100; //in cm
  int weight = 50;
  int age = 20;
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xff0C3B2E),
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  gender = "male";
                  setState(() {});
                },
                child: BmiCard(
                  borderColor: (gender == "male") ? Colors.white : primaryColor,
                  child: GenderIconText(
                    icon: Icons.man,
                    title: 'Laki-Laki',
                    color:
                        (gender == "male") ? Color(0xffffba00) : Colors.white,
                  ),
                ),
              )),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    gender = "female";
                    setState(() {});
                  },
                  child: BmiCard(
                    borderColor:
                        (gender == "female") ? Colors.white : primaryColor,
                    child: GenderIconText(
                      icon: Icons.woman,
                      title: 'Perempuan',
                      color: (gender == "female")
                          ? Color(0xffffba00)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: BmiCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tinggi',
                style: labelTextStyle!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "$height",
                    style: numberTextStyle,
                  ),
                  Text(
                    'cm',
                    style: labelTextStyle,
                  )
                ],
              ),
              Slider(
                value: height.toDouble(),
                min: 80,
                max: 200,
                thumbColor: Color(0xffffba00),
                activeColor: Colors.white,
                onChanged: (value) {
                  height = value.toInt();
                  setState(() {});
                },
              )
            ],
          ),
        )),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: BmiCard(
                child: Column(children: [
                  Text(
                    'Berat Badan',
                    style: labelTextStyle,
                  ),
                  Text(
                    "$weight",
                    style: numberTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RawMaterialButton(
                        onPressed: () {
                          weight--;
                          setState(() {});
                        },
                        elevation: 0,
                        shape: const CircleBorder(),
                        // fillColor: Color(0xff2127247),
                        constraints: const BoxConstraints.tightFor(
                          width: 56,
                          height: 56,
                        ),
                        child: Icon(
                          color: Colors.white,
                          Icons.remove,
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          weight++;
                          setState(() {});
                        },
                        elevation: 0,
                        shape: const CircleBorder(),
                        // fillColor: Color(0xff2127247),
                        constraints: const BoxConstraints.tightFor(
                          width: 56,
                          height: 56,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ]),
              )),
              Expanded(
                  child: BmiCard(
                child: Column(children: [
                  Text(
                    'Umur',
                    style: labelTextStyle,
                  ),
                  Text(
                    "$age",
                    style: numberTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RawMaterialButton(
                        onPressed: () {
                          age--;
                          setState(() {});
                        },
                        elevation: 0,
                        shape: const CircleBorder(),
                        // fillColor: Color(0xff2127247),
                        constraints: const BoxConstraints.tightFor(
                          width: 56,
                          height: 56,
                        ),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          age++;
                          setState(() {});
                        },
                        elevation: 0,
                        shape: const CircleBorder(),
                        // fillColor: Color(0xff2127247),
                        constraints: const BoxConstraints.tightFor(
                          width: 56,
                          height: 56,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ]),
              )),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            final bmiCalculator = BmiCalculator(height: height, weight: weight);
            bmiCalculator.calculateBmi();

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) {
                  return BmiResultScreen(
                    bmi: bmiCalculator.bmi!,
                  );
                }),
              ),
            );
          },
          child: Container(
            height: 80,
            color: const Color(0xffFFBA00),
            child: const Center(
              child: Text(
                'Hitung BMI',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff6D9773),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor!,
          )),
      margin: const EdgeInsets.all(15),
      child: child,
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
    this.color = const Color(0xffffffff),
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: color,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(title, style: genderTextStyle),
      ],
    );
  }
}

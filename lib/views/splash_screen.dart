import 'package:flutter/material.dart';
import 'package:bmi_1/views/bmi_data_screen.dart';
import 'dart:async';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const BmiDataScreen()),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.4,
            width: MediaQuery.of(context).size.width / 1.5,
            child: Image.asset(
              'assets/bmi_logo.jpg',
              fit: BoxFit.contain,
            ),
          ),
          const Center(
            child: Text(
              'BMI Calculator',
              style: TextStyle(fontSize: 40, color: Color(0xffffba00)),
            ),
          ),
        ],
      ),
    );
  }
}

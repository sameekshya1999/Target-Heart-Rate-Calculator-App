import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const HeartRatesCalculatorApp());
}

class HeartRatesCalculatorApp extends StatelessWidget {
  const HeartRatesCalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heart Rates Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HeartRatesCalculator(),
    );
  }
}

class HeartRatesCalculator extends StatefulWidget {
  const HeartRatesCalculator({Key? key}) : super(key: key);

  @override
  _HeartRatesCalculatorState createState() => _HeartRatesCalculatorState();
}

class _HeartRatesCalculatorState extends State<HeartRatesCalculator> {
  TextEditingController ageController = TextEditingController();
  String maxHeartRate = '';
  String targetHeartRateRange = '';

  void calculateHeartRates() {
    double age = double.tryParse(ageController.text) ?? 0;
    int maxHeartRate = (220 - age).toInt();
    int minTargetHeartRate = maxHeartRate ~/ 2; // Integer division
    int maxTargetHeartRate = ((maxHeartRate * 0.85).toInt()).ceil();

    setState(() {
      this.maxHeartRate = maxHeartRate.toString();
      targetHeartRateRange = '$minTargetHeartRate - $maxTargetHeartRate';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heart Rates Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter your age',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: calculateHeartRates,
              child: const Text('Calculate Heart Rates'),
            ),
            const SizedBox(height: 16.0),
            Text('Maximum Heart Rate: $maxHeartRate bpm'),
            Text('Target Heart Rate Range: $targetHeartRateRange bpm'),
          ],
        ),
      ),
    );
  }
}

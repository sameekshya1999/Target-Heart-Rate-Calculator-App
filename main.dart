import 'package:flutter/material.dart';

void main() {
  runApp(const TargetHeartRateApp());
}

class TargetHeartRateApp extends StatelessWidget {
  const TargetHeartRateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Target Heart Rate Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const TargetHeartRateScreen(),
    );
  }
}

class TargetHeartRateScreen extends StatefulWidget {
  const TargetHeartRateScreen({super.key});

  @override
  _TargetHeartRateScreenState createState() => _TargetHeartRateScreenState();
}

class _TargetHeartRateScreenState extends State<TargetHeartRateScreen> {
  TextEditingController ageController = TextEditingController();
  String maxHeartRate = '';
  String targetHeartRateRange = '';

  void calculateHeartRates() {
    int age = int.tryParse(ageController.text) ?? 0;
    int maxHeartRate = 220 - age;
    int minTargetHeartRate = (maxHeartRate * 0.5).toInt();
    int maxTargetHeartRate = (maxHeartRate * 0.85).toInt();

    setState(() {
      this.maxHeartRate = maxHeartRate.toString();
      targetHeartRateRange = '$minTargetHeartRate - $maxTargetHeartRate';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Target Heart Rate Calculator'),
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

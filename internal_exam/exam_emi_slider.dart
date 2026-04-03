import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double loan = 50000;
  double years = 1;
  double rate = 8;

  double emiValue(double principal, double termYears, double annualRate) {
    double r = annualRate / 12 / 100;
    double n = termYears * 12;
    double top = principal * r * math.pow(1 + r, n).toDouble();
    double bottom = math.pow(1 + r, n).toDouble() - 1;
    return top / bottom;
  }

  @override
  Widget build(BuildContext context) {
    double emi = emiValue(loan, years, rate);

    return Scaffold(
      appBar: AppBar(title: Text('EMI Slider')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Loan Amount: Rs. ${loan.toInt()}'),
            Slider(
              value: loan,
              min: 50000,
              max: 500000,
              divisions: 9,
              onChanged: (value) => setState(() => loan = value),
            ),
            Text('Term: ${years.toInt()} year(s)'),
            Slider(
              value: years,
              min: 1,
              max: 3,
              divisions: 2,
              onChanged: (value) => setState(() => years = value),
            ),
            Text('Rate: ${rate.toStringAsFixed(0)}%'),
            Slider(
              value: rate,
              min: 8,
              max: 12,
              divisions: 4,
              onChanged: (value) => setState(() => rate = value),
            ),
            SizedBox(height: 16),
            Text('EMI: Rs. ${emi.toStringAsFixed(0)}', style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}

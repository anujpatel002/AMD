import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double loanAmount = 50000;
  double termYears = 1;
  double rateOfInterest = 8;

  double calculateEmi(double principal, double years, double rate) {
    double monthlyRate = rate / 12 / 100;
    double months = years * 12;

    if (monthlyRate == 0) {
      return principal / months;
    }

    double top = principal * monthlyRate * math.pow(1 + monthlyRate, months).toDouble();
    double bottom = math.pow(1 + monthlyRate, months).toDouble() - 1;
    return top / bottom;
  }

  @override
  Widget build(BuildContext context) {
    double emi = calculateEmi(loanAmount, termYears, rateOfInterest);

    Text loanText = Text('Loan Amount: ₹ ${loanAmount.toInt()}');
    Slider loanSlider = Slider(
      value: loanAmount,
      min: 50000,
      max: 500000,
      divisions: 9,
      label: loanAmount.toInt().toString(),
      onChanged: (value) {
        setState(() {
          loanAmount = value;
        });
      },
    );

    Text termText = Text('Term: ${termYears.toInt()} years');
    Slider termSlider = Slider(
      value: termYears,
      min: 1,
      max: 3,
      divisions: 2,
      label: termYears.toInt().toString(),
      onChanged: (value) {
        setState(() {
          termYears = value;
        });
      },
    );

    Text rateText = Text('Rate of Interest: ${rateOfInterest.toInt()}%');
    Slider rateSlider = Slider(
      value: rateOfInterest,
      min: 8,
      max: 12,
      divisions: 4,
      label: rateOfInterest.toInt().toString(),
      onChanged: (value) {
        setState(() {
          rateOfInterest = value;
        });
      },
    );

    Text emiText = Text(
      'EMI: ₹ ${emi.toStringAsFixed(0)}',
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );

    List<Widget> mainList = [
      loanText,
      loanSlider,
      SizedBox(height: 16),
      termText,
      termSlider,
      SizedBox(height: 16),
      rateText,
      rateSlider,
      SizedBox(height: 24),
      emiText,
    ];

    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: mainList,
    );

    Padding padding = Padding(
      padding: EdgeInsets.all(16),
      child: column,
    );

    Scaffold scaffold = Scaffold(
      appBar: AppBar(title: Text('EMI Calculator')),
      body: SingleChildScrollView(child: padding),
    );

    MaterialApp app = MaterialApp(
      debugShowCheckedModeBanner: false,
      home: scaffold,
    );

    return app;
  }
}

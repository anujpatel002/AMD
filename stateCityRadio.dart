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
  String selectedState = 'Gujarat';
  String selectedCity = '';

  Map<String, List<String>> cityMap = {
    'Gujarat': ['Ahmedabad', 'Surat', 'Vadodara'],
    'Maharashtra': ['Mumbai', 'Pune', 'Nagpur'],
    'Rajasthan': ['Jaipur', 'Udaipur', 'Jodhpur'],
  };

  @override
  Widget build(BuildContext context) {
    List<String> stateList = ['Gujarat', 'Maharashtra', 'Rajasthan'];
    List<String> cityList = cityMap[selectedState] ?? [];

    DropdownButton<String> stateDrop = DropdownButton<String>(
      value: selectedState,
      items: stateList.map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedState = value!;
          selectedCity = '';
        });
      },
    );

    List<Widget> radioList = [];
    for (int i = 0; i < cityList.length; i++) {
      radioList.add(
        RadioListTile<String>(
          title: Text(cityList[i]),
          value: cityList[i],
          groupValue: selectedCity,
          onChanged: (value) {
            setState(() {
              selectedCity = value!;
            });
          },
        ),
      );
    }

    Text resultText = Text(
      selectedCity.isEmpty ? 'Selected City: None' : 'Selected City: $selectedCity',
      style: TextStyle(fontSize: 18),
    );

    List<Widget> mainList = [
      Text('Select State'),
      SizedBox(height: 8),
      stateDrop,
      SizedBox(height: 20),
      Text('Select City'),
      SizedBox(height: 8),
      ...radioList,
      SizedBox(height: 20),
      resultText,
    ];

    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: mainList,
    );

    Padding padding = Padding(
      padding: EdgeInsets.all(16),
      child: column,
    );

    Scaffold scaffold = Scaffold(
      appBar: AppBar(title: Text('State and City')),
      body: SingleChildScrollView(child: padding),
    );

    return scaffold;
  }
}

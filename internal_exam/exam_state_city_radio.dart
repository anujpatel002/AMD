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
    List<String> cities = cityMap[selectedState] ?? [];

    DropdownButton<String> stateDrop = DropdownButton<String>(
      value: selectedState,
      items: cityMap.keys.map((value) => DropdownMenuItem(value: value, child: Text(value))).toList(),
      onChanged: (value) {
        setState(() {
          selectedState = value!;
          selectedCity = '';
        });
      },
    );

    List<Widget> cityRadios = [];
    for (int i = 0; i < cities.length; i++) {
      cityRadios.add(
        RadioListTile<String>(
          title: Text(cities[i]),
          value: cities[i],
          groupValue: selectedCity,
          onChanged: (value) {
            setState(() {
              selectedCity = value!;
            });
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('State City Radio')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text('Select State'),
          stateDrop,
          SizedBox(height: 12),
          Text('Cities'),
          ...cityRadios,
          SizedBox(height: 12),
          Text('Selected City: ${selectedCity.isEmpty ? 'None' : selectedCity}'),
        ],
      ),
    );
  }
}

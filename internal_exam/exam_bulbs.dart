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
  bool hall = false;
  bool kitchen = false;
  bool bedroom = false;
  bool lobby = false;

  @override
  Widget build(BuildContext context) {
    Widget oneRow(String title, bool value, void Function(bool?) onChanged) {
      Color bulbColor = value ? Colors.yellow : Colors.grey;
      return Row(
        children: [
          Expanded(
            child: CheckboxListTile(
              title: Text(title),
              value: value,
              onChanged: onChanged,
            ),
          ),
          Icon(Icons.lightbulb, color: bulbColor, size: 44),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Bulb Control')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          oneRow('Hall', hall, (v) => setState(() => hall = v!)),
          oneRow('Kitchen', kitchen, (v) => setState(() => kitchen = v!)),
          oneRow('Bedroom', bedroom, (v) => setState(() => bedroom = v!)),
          oneRow('Lobby', lobby, (v) => setState(() => lobby = v!)),
        ],
      ),
    );
  }
}

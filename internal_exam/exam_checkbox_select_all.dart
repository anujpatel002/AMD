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
  bool all = false;
  bool pizza = false;
  bool fries = false;
  bool drink = false;

  @override
  Widget build(BuildContext context) {
    List<String> items = [];
    int total = 0;

    if (pizza) {
      items.add('Pizza');
      total += 250;
    }
    if (fries) {
      items.add('French Fries');
      total += 80;
    }
    if (drink) {
      items.add('Colddrink');
      total += 50;
    }

    return Scaffold(
      appBar: AppBar(title: Text('Select All Checkbox')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          CheckboxListTile(
            title: Text('Select All'),
            value: all,
            onChanged: (v) {
              setState(() {
                all = v!;
                pizza = all;
                fries = all;
                drink = all;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Pizza (Rs. 250)'),
            value: pizza,
            onChanged: (v) {
              setState(() {
                pizza = v!;
                all = pizza && fries && drink;
              });
            },
          ),
          CheckboxListTile(
            title: Text('French Fries (Rs. 80)'),
            value: fries,
            onChanged: (v) {
              setState(() {
                fries = v!;
                all = pizza && fries && drink;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Colddrink (Rs. 50)'),
            value: drink,
            onChanged: (v) {
              setState(() {
                drink = v!;
                all = pizza && fries && drink;
              });
            },
          ),
          SizedBox(height: 12),
          Text('Selected Items: ${items.isEmpty ? 'None' : items.join(', ')}'),
          SizedBox(height: 8),
          Text('Total Price: Rs. $total'),
        ],
      ),
    );
  }
}

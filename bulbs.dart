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
    Color hallColor = hall ? Colors.yellow : Colors.grey;
    Color kitchenColor = kitchen ? Colors.yellow : Colors.grey;
    Color bedroomColor = bedroom ? Colors.yellow : Colors.grey;
    Color lobbyColor = lobby ? Colors.yellow : Colors.grey;

    CheckboxListTile hallBox = CheckboxListTile(
      title: Text('Hall'),
      value: hall,
      onChanged: (value) {
        setState(() {
          hall = value!;
        });
      },
    );

    CheckboxListTile kitchenBox = CheckboxListTile(
      title: Text('Kitchen'),
      value: kitchen,
      onChanged: (value) {
        setState(() {
          kitchen = value!;
        });
      },
    );

    CheckboxListTile bedroomBox = CheckboxListTile(
      title: Text('Bedroom'),
      value: bedroom,
      onChanged: (value) {
        setState(() {
          bedroom = value!;
        });
      },
    );

    CheckboxListTile lobbyBox = CheckboxListTile(
      title: Text('Lobby'),
      value: lobby,
      onChanged: (value) {
        setState(() {
          lobby = value!;
        });
      },
    );

    Icon hallBulb = Icon(Icons.lightbulb, color: hallColor, size: 50);
    Icon kitchenBulb = Icon(Icons.lightbulb, color: kitchenColor, size: 50);
    Icon bedroomBulb = Icon(Icons.lightbulb, color: bedroomColor, size: 50);
    Icon lobbyBulb = Icon(Icons.lightbulb, color: lobbyColor, size: 50);

    Row hallRow = Row(
      children: [
        Expanded(child: hallBox),
        hallBulb,
      ],
    );

    Row kitchenRow = Row(
      children: [
        Expanded(child: kitchenBox),
        kitchenBulb,
      ],
    );

    Row bedroomRow = Row(
      children: [
        Expanded(child: bedroomBox),
        bedroomBulb,
      ],
    );

    Row lobbyRow = Row(
      children: [
        Expanded(child: lobbyBox),
        lobbyBulb,
      ],
    );

    List<Widget> mainList = [
      hallRow,
      kitchenRow,
      bedroomRow,
      lobbyRow,
    ];

    ListView listView = ListView(
      padding: EdgeInsets.all(16),
      children: mainList,
    );

    Scaffold scaffold = Scaffold(
      appBar: AppBar(title: Text('Bulbs')),
      body: listView,
    );

    return scaffold;
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController startCtrl = TextEditingController();
  TextEditingController endCtrl = TextEditingController();
  List<int> numberList = [];

  @override
  void dispose() {
    startCtrl.dispose();
    endCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Text startText = Text('Starting Number');
    TextField startField = TextField(
      controller: startCtrl,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter starting number',
      ),
    );

    SizedBox space1 = SizedBox(height: 12);
    Text endText = Text('Ending Number');
    TextField endField = TextField(
      controller: endCtrl,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter ending number',
      ),
    );

    SizedBox space2 = SizedBox(height: 16);
    Text btnText = Text('Show range');
    ElevatedButton btn = ElevatedButton(
      onPressed: () {
        int startNum = int.tryParse(startCtrl.text) ?? 0;
        int endNum = int.tryParse(endCtrl.text) ?? 0;

        setState(() {
          numberList = [];
          if (startNum <= endNum) {
            for (int i = startNum; i <= endNum; i++) {
              numberList.add(i);
            }
          }
        });
      },
      child: btnText,
    );

    SizedBox space3 = SizedBox(height: 16);
    Expanded listBox = Expanded(
      child: ListView.builder(
        itemCount: numberList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(numberList[index].toString()),
          );
        },
      ),
    );

    List<Widget> mainList = [
      startText,
      startField,
      space1,
      endText,
      endField,
      space2,
      btn,
      space3,
      listBox,
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
      appBar: AppBar(title: Text('List Range')),
      body: padding,
    );

    MaterialApp app = MaterialApp(
      debugShowCheckedModeBanner: false,
      home: scaffold,
    );

    return app;
  }
}

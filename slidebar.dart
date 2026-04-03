import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp())); // ✅ FIXED
}

// Stateful App
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  double a = 1, b = 1, c = 1;
  int maxVal = 1;

  @override
  Widget build(BuildContext context) {

    // Text A
    Text textA = Text("a = ${a.toInt()}");

    // Slider A
    Slider sliderAWidget = Slider(
      value: a,
      min: 1,
      max: 5,
      divisions: 4,
      onChanged: (val) {
        setState(() {
          a = val;
        });
      },
    );

    List<Widget> listA = [textA, sliderAWidget];
    Column sliderA = Column(children: listA);

    // Text B
    Text textB = Text("b = ${b.toInt()}");

    // Slider B
    Slider sliderBWidget = Slider(
      value: b,
      min: 1,
      max: 5,
      divisions: 4,
      onChanged: (val) {
        setState(() {
          b = val;
        });
      },
    );

    List<Widget> listB = [textB, sliderBWidget];
    Column sliderB = Column(children: listB);

    // Text C
    Text textC = Text("c = ${c.toInt()}");

    // Slider C
    Slider sliderCWidget = Slider(
      value: c,
      min: 1,
      max: 5,
      divisions: 4,
      onChanged: (val) {
        setState(() {
          c = val;
        });
      },
    );

    List<Widget> listC = [textC, sliderCWidget];
    Column sliderC = Column(children: listC);

    // Button Text
    Text btnText = Text("Show Max");

    // Button
    ElevatedButton btn = ElevatedButton(
      onPressed: () {
        setState(() {
          List<int> values = [a.toInt(), b.toInt(), c.toInt()];
          maxVal = values.reduce((x, y) => x > y ? x : y);
        });
      },
      child: btnText,
    );

    // Result Text
    Text result = Text("Max = $maxVal");

    // SizedBoxes
    SizedBox space1 = SizedBox(height: 20);
    SizedBox space2 = SizedBox(height: 10);

    // Main List
    List<Widget> mainList = [
      sliderA,
      sliderB,
      sliderC,
      space1,
      btn,
      space2,
      result,
    ];

    // Column
    Column column = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: mainList,
    );

    // Padding
    EdgeInsets paddingValue = EdgeInsets.all(16);

    Padding padding = Padding(
      padding: paddingValue,
      child: column,
    );

    // AppBar Text
    Text appBarText = Text("Max Finder");

    // AppBar
    AppBar appBar = AppBar(title: appBarText);

    // Scaffold
    Scaffold scaffold = Scaffold(
      appBar: appBar,
      body: padding,
    );

    return scaffold; // ✅ FIXED
  }
}
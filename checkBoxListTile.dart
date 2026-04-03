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
  bool selectAll = false;
  bool pizza = false;
  bool frenchFries = false;
  bool colddrink = false;

  @override
  Widget build(BuildContext context) {
    List<String> itemList = [];
    int totalPrice = 0;

    if (pizza) {
      itemList.add('Pizza');
      totalPrice = totalPrice + 250;
    }
    if (frenchFries) {
      itemList.add('French Fries');
      totalPrice = totalPrice + 80;
    }
    if (colddrink) {
      itemList.add('Colddrink');
      totalPrice = totalPrice + 50;
    }

    String selectedItemsText = itemList.isEmpty ? 'Selected Items: None' : 'Selected Items: ${itemList.join(', ')}';
    String totalPriceText = 'Total Price: Rs. $totalPrice';

    Text selectedText = Text(selectedItemsText);
    Text priceText = Text(totalPriceText);

    CheckboxListTile selectAllTile = CheckboxListTile(
      title: Text('Select All'),
      value: selectAll,
      onChanged: (value) {
        setState(() {
          selectAll = value!;
          pizza = selectAll;
          frenchFries = selectAll;
          colddrink = selectAll;
        });
      },
    );

    CheckboxListTile pizzaTile = CheckboxListTile(
      title: Text('Pizza (Rs. 250)'),
      value: pizza,
      onChanged: (value) {
        setState(() {
          pizza = value!;
          selectAll = pizza && frenchFries && colddrink;
        });
      },
    );

    CheckboxListTile friesTile = CheckboxListTile(
      title: Text('French Fries (Rs. 80)'),
      value: frenchFries,
      onChanged: (value) {
        setState(() {
          frenchFries = value!;
          selectAll = pizza && frenchFries && colddrink;
        });
      },
    );

    CheckboxListTile drinkTile = CheckboxListTile(
      title: Text('Colddrink (Rs. 50)'),
      value: colddrink,
      onChanged: (value) {
        setState(() {
          colddrink = value!;
          selectAll = pizza && frenchFries && colddrink;
        });
      },
    );

    List<Widget> mainList = [
      selectAllTile,
      pizzaTile,
      friesTile,
      drinkTile,
      SizedBox(height: 20),
      selectedText,
      SizedBox(height: 12),
      priceText,
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
      appBar: AppBar(title: Text('Checkbox Items')),
      body: padding,
    );

    MaterialApp app = MaterialApp(
      debugShowCheckedModeBanner: false,
      home: scaffold,
    );

    return app;
  }
}

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
  int breakfastStock = 30;
  int lunchStock = 40;
  int dinnerStock = 30;

  int breakfastSold = 0;
  int lunchSold = 0;
  int dinnerSold = 0;

  int breakfastQty = 0;
  int lunchQty = 0;
  int dinnerQty = 0;

  double breakfastPrice = 0;
  double lunchPrice = 0;
  double dinnerPrice = 0;

  double targetSale = 0;
  double saleAchieved = 0;

  @override
  Widget build(BuildContext context) {
    List<int> breakfastQtyList = breakfastStock < 5 ? [1, 2, 3, 4] : [1, 2, 3, 4, 5];
    List<int> lunchQtyList = lunchStock < 5 ? [1, 2, 3, 4] : [1, 2, 3, 4, 5];
    List<int> dinnerQtyList = dinnerStock < 5 ? [1, 2, 3, 4] : [1, 2, 3, 4, 5];

    targetSale = (30 * 40) + (40 * 80) + (30 * 60);
    saleAchieved = (breakfastSold * 40) + (lunchSold * 80) + (dinnerSold * 60);

    Text itemHead = Text('Item');
    Text qtyHead = Text('Quantity to sell', textAlign: TextAlign.center);
    Text priceHead = Text('Total Price\n(Unit Price X Quantity to sell)', textAlign: TextAlign.center);
    Text orderHead = Text('Place Order');
    Text soldHead = Text('Total Quantity Sold', textAlign: TextAlign.center);
    Text remainHead = Text('Total Quantity Remaining', textAlign: TextAlign.center);

    List<Widget> headList = [itemHead, qtyHead, priceHead, orderHead, soldHead, remainHead];
    Row headRow = Row(
      children: [
        Expanded(child: Center(child: headList[0])),
        Expanded(child: Center(child: headList[1])),
        Expanded(child: Center(child: headList[2])),
        Expanded(child: Center(child: headList[3])),
        Expanded(child: Center(child: headList[4])),
        Expanded(child: Center(child: headList[5])),
      ],
    );

    DropdownButton<int> breakfastDrop = DropdownButton<int>(
      value: breakfastQtyList.contains(breakfastQty) ? breakfastQty : null,
      hint: Text('0'),
      items: breakfastQtyList.map((value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          breakfastQty = value!;
          breakfastPrice = 40 * breakfastQty.toDouble();
        });
      },
    );

    DropdownButton<int> lunchDrop = DropdownButton<int>(
      value: lunchQtyList.contains(lunchQty) ? lunchQty : null,
      hint: Text('0'),
      items: lunchQtyList.map((value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          lunchQty = value!;
          lunchPrice = 80 * lunchQty.toDouble();
        });
      },
    );

    DropdownButton<int> dinnerDrop = DropdownButton<int>(
      value: dinnerQtyList.contains(dinnerQty) ? dinnerQty : null,
      hint: Text('0'),
      items: dinnerQtyList.map((value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          dinnerQty = value!;
          dinnerPrice = 60 * dinnerQty.toDouble();
        });
      },
    );

    Text breakfastPriceText = Text(breakfastPrice.toStringAsFixed(0));
    Text lunchPriceText = Text(lunchPrice.toStringAsFixed(0));
    Text dinnerPriceText = Text(dinnerPrice.toStringAsFixed(0));

    ElevatedButton breakfastBtn = ElevatedButton(
      onPressed: () {
        setState(() {
          if (breakfastStock >= breakfastQty) {
            breakfastStock = breakfastStock - breakfastQty;
            breakfastSold = breakfastSold + breakfastQty;
            breakfastPrice = 40 * breakfastQty.toDouble();
            saleAchieved = (breakfastSold * 40) + (lunchSold * 80) + (dinnerSold * 60);
          }
        });
      },
      child: Text('Sell'),
    );

    ElevatedButton lunchBtn = ElevatedButton(
      onPressed: () {
        setState(() {
          if (lunchStock >= lunchQty) {
            lunchStock = lunchStock - lunchQty;
            lunchSold = lunchSold + lunchQty;
            lunchPrice = 80 * lunchQty.toDouble();
            saleAchieved = (breakfastSold * 40) + (lunchSold * 80) + (dinnerSold * 60);
          }
        });
      },
      child: Text('Sell'),
    );

    ElevatedButton dinnerBtn = ElevatedButton(
      onPressed: () {
        setState(() {
          if (dinnerStock >= dinnerQty) {
            dinnerStock = dinnerStock - dinnerQty;
            dinnerSold = dinnerSold + dinnerQty;
            dinnerPrice = 60 * dinnerQty.toDouble();
            saleAchieved = (breakfastSold * 40) + (lunchSold * 80) + (dinnerSold * 60);
          }
        });
      },
      child: Text('Sell'),
    );

    Text breakfastSoldText = Text(breakfastSold.toString());
    Text lunchSoldText = Text(lunchSold.toString());
    Text dinnerSoldText = Text(dinnerSold.toString());

    Text breakfastRemainText = Text(breakfastStock.toString());
    Text lunchRemainText = Text(lunchStock.toString());
    Text dinnerRemainText = Text(dinnerStock.toString());

    Row breakfastRow = Row(
      children: [
        Expanded(child: Center(child: Text('Breakfast'))),
        Expanded(child: Center(child: breakfastDrop)),
        Expanded(child: Center(child: breakfastPriceText)),
        Expanded(child: Center(child: breakfastBtn)),
        Expanded(child: Center(child: breakfastSoldText)),
        Expanded(child: Center(child: breakfastRemainText)),
      ],
    );

    Row lunchRow = Row(
      children: [
        Expanded(child: Center(child: Text('Lunch'))),
        Expanded(child: Center(child: lunchDrop)),
        Expanded(child: Center(child: lunchPriceText)),
        Expanded(child: Center(child: lunchBtn)),
        Expanded(child: Center(child: lunchSoldText)),
        Expanded(child: Center(child: lunchRemainText)),
      ],
    );

    Row dinnerRow = Row(
      children: [
        Expanded(child: Center(child: Text('Dinner'))),
        Expanded(child: Center(child: dinnerDrop)),
        Expanded(child: Center(child: dinnerPriceText)),
        Expanded(child: Center(child: dinnerBtn)),
        Expanded(child: Center(child: dinnerSoldText)),
        Expanded(child: Center(child: dinnerRemainText)),
      ],
    );

    Text targetText = Text('Total Target Sale Amount: ${targetSale.toStringAsFixed(0)}');
    Text achievedText = Text('Total Sale Amount achieved: ${saleAchieved.toStringAsFixed(0)}');
    Text remainingText = Text('Total Sale Amount Remaining: ${(targetSale - saleAchieved).toStringAsFixed(0)}');

    CircleAvatar targetBadge = CircleAvatar(
      backgroundColor: Colors.blue,
      child: Text(targetSale.toStringAsFixed(0), style: TextStyle(color: Colors.white)),
    );
    CircleAvatar achievedBadge = CircleAvatar(
      backgroundColor: Colors.green,
      child: Text(saleAchieved.toStringAsFixed(0), style: TextStyle(color: Colors.white)),
    );
    CircleAvatar remainingBadge = CircleAvatar(
      backgroundColor: Colors.red,
      child: Text((targetSale - saleAchieved).toStringAsFixed(0), style: TextStyle(color: Colors.white)),
    );

    Row badgeRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [targetBadge, achievedBadge, remainingBadge],
    );

    List<Widget> tableList = [
      headRow,
      Divider(),
      breakfastRow,
      Divider(),
      lunchRow,
      Divider(),
      dinnerRow,
    ];

    Column tableColumn = Column(children: tableList);

    List<Widget> mainList = [
      tableColumn,
      SizedBox(height: 20),
      badgeRow,
      SizedBox(height: 12),
      targetText,
      achievedText,
      remainingText,
    ];

    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: mainList,
    );

    Padding padding = Padding(
      padding: EdgeInsets.all(12),
      child: column,
    );

    Scaffold scaffold = Scaffold(
      appBar: AppBar(title: Text('Food Shop Sales')),
      body: SingleChildScrollView(child: padding),
    );

    return scaffold;
  }
}

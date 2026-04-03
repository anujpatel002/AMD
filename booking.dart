import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

enum SeatState {
  available,
  selected,
  booked,
  releaseSelected,
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<SeatState> seats = List.generate(15, (index) => SeatState.available);

  int bookedCount = 0;
  int availableCount = 15;
  int earning = 0;

  List<String> seatNames = [
    'A1', 'A2', 'A3', 'A4', 'A5',
    'B1', 'B2', 'B3', 'B4', 'B5',
    'C1', 'C2', 'C3', 'C4', 'C5',
  ];

  int seatPrice(int index) {
    if (index < 5) {
      return 800;
    } else if (index < 10) {
      return 600;
    }
    return 500;
  }

  Color seatColor(SeatState state) {
    if (state == SeatState.selected) {
      return Colors.red;
    }
    if (state == SeatState.booked) {
      return Colors.red;
    }
    if (state == SeatState.releaseSelected) {
      return Colors.yellow;
    }
    return Colors.white;
  }

  void updateCounts() {
    bookedCount = 0;
    availableCount = 0;
    earning = 0;

    for (int i = 0; i < seats.length; i++) {
      if (seats[i] == SeatState.booked) {
        bookedCount++;
        earning = earning + seatPrice(i);
      } else {
        availableCount++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    updateCounts();

    List<Widget> seatWidgets = [];
    for (int i = 0; i < seats.length; i++) {
      seatWidgets.add(
        GestureDetector(
          onTap: () {
            setState(() {
              if (seats[i] == SeatState.available) {
                seats[i] = SeatState.selected;
              } else if (seats[i] == SeatState.selected) {
                seats[i] = SeatState.available;
              } else if (seats[i] == SeatState.booked) {
                seats[i] = SeatState.releaseSelected;
              } else if (seats[i] == SeatState.releaseSelected) {
                seats[i] = SeatState.booked;
              }
            });
          },
          child: Container(
            height: 35,
            decoration: BoxDecoration(
              color: seatColor(seats[i]),
              border: Border.all(color: Colors.black),
            ),
            alignment: Alignment.center,
            child: Text(seatNames[i]),
          ),
        ),
      );
    }

    List<Widget> rowA = [seatWidgets[0], seatWidgets[1], seatWidgets[2], seatWidgets[3], seatWidgets[4]];
    List<Widget> rowB = [seatWidgets[5], seatWidgets[6], seatWidgets[7], seatWidgets[8], seatWidgets[9]];
    List<Widget> rowC = [seatWidgets[10], seatWidgets[11], seatWidgets[12], seatWidgets[13], seatWidgets[14]];

    Row seatRowA = Row(children: [
      Expanded(child: rowA[0]),
      Expanded(child: rowA[1]),
      Expanded(child: rowA[2]),
      Expanded(child: rowA[3]),
      Expanded(child: rowA[4]),
    ]);

    Row seatRowB = Row(children: [
      Expanded(child: rowB[0]),
      Expanded(child: rowB[1]),
      Expanded(child: rowB[2]),
      Expanded(child: rowB[3]),
      Expanded(child: rowB[4]),
    ]);

    Row seatRowC = Row(children: [
      Expanded(child: rowC[0]),
      Expanded(child: rowC[1]),
      Expanded(child: rowC[2]),
      Expanded(child: rowC[3]),
      Expanded(child: rowC[4]),
    ]);

    Container seatTable = Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          seatRowA,
          seatRowB,
          seatRowC,
        ],
      ),
    );

    ElevatedButton bookButton = ElevatedButton(
      onPressed: () {
        setState(() {
          for (int i = 0; i < seats.length; i++) {
            if (seats[i] == SeatState.selected) {
              seats[i] = SeatState.booked;
            }
          }
        });
      },
      child: Text('Book'),
    );

    ElevatedButton releaseButton = ElevatedButton(
      onPressed: () {
        setState(() {
          for (int i = 0; i < seats.length; i++) {
            if (seats[i] == SeatState.releaseSelected) {
              seats[i] = SeatState.available;
            }
          }
        });
      },
      child: Text('Release'),
    );

    Row buttonRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [bookButton, releaseButton],
    );

    Text bookedText = Text('Total no. of seats booked: $bookedCount');
    Text availableText = Text('Total no. of seats available: $availableCount');
    Text earningText = Text('Total Earning Rs. $earning');

    List<Widget> mainList = [
      SizedBox(height: 20),
      Center(child: seatTable),
      SizedBox(height: 20),
      buttonRow,
      SizedBox(height: 24),
      bookedText,
      SizedBox(height: 8),
      availableText,
      SizedBox(height: 8),
      earningText,
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
      appBar: AppBar(title: Text('Auditorium Booking')),
      body: SingleChildScrollView(child: padding),
    );

    return scaffold;
  }
}

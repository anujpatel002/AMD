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
  DateTime selectedDate = DateTime.now();
  String selectedSlot = '10 to 11';
  List<String> bookedList = [];
  int bookedCount = 0;
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    String dateValue = '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';

    Text dateText = Text('Date: $dateValue');
    ElevatedButton dateButton = ElevatedButton(
      onPressed: () async {
        DateTime today = DateTime.now();
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: today,
          firstDate: DateTime(today.year, today.month, today.day),
          lastDate: DateTime(today.year, today.month, today.day),
        );

        if (pickedDate != null) {
          setState(() {
            selectedDate = pickedDate;
            errorText = '';
          });
        }
      },
      child: Text('Select Date'),
    );

    DropdownButton<String> slotDrop = DropdownButton<String>(
      value: selectedSlot,
      items: [
        DropdownMenuItem(value: '10 to 11', child: Text('10 to 11')),
        DropdownMenuItem(value: '11 to 12', child: Text('11 to 12')),
        DropdownMenuItem(value: '12 to 1', child: Text('12 to 1')),
        DropdownMenuItem(value: '4 to 5', child: Text('4 to 5')),
        DropdownMenuItem(value: '5 to 6', child: Text('5 to 6')),
        DropdownMenuItem(value: '6 to 7', child: Text('6 to 7')),
      ],
      onChanged: (value) {
        setState(() {
          selectedSlot = value!;
          errorText = '';
        });
      },
    );

    Text bookText = Text('Book');
    ElevatedButton bookButton = ElevatedButton(
      onPressed: () {
        String bookItem = '$dateValue - $selectedSlot';

        if (bookedList.contains(bookItem)) {
          setState(() {
            errorText = 'Slot not available';
          });
        } else {
          setState(() {
            bookedList.add(bookItem);
            bookedCount = bookedList.length;
            errorText = '';
          });
        }
      },
      child: bookText,
    );

    Text resetText = Text('Reset');
    OutlinedButton resetButton = OutlinedButton(
      onPressed: () {
        setState(() {
          bookedList.clear();
          bookedCount = 0;
          errorText = '';
          selectedDate = DateTime.now();
          selectedSlot = '10 to 11';
        });
      },
      child: resetText,
    );

    CircleAvatar badge = CircleAvatar(
      radius: 18,
      backgroundColor: Colors.blue,
      child: Text(
        bookedCount.toString(),
        style: TextStyle(color: Colors.white),
      ),
    );

    List<Widget> listChildren = [];
    for (int i = 0; i < bookedList.length; i++) {
      listChildren.add(
        ListTile(
          title: Text(bookedList[i]),
        ),
      );
    }

    SizedBox listBox = SizedBox(
      height: 220,
      child: ListView(
        children: listChildren,
      ),
    );

    Text errorWidget = Text(
      errorText,
      style: TextStyle(color: Colors.red),
      textAlign: TextAlign.center,
    );

    Row buttonRow = Row(
      children: [
        Expanded(child: bookButton),
        SizedBox(width: 12),
        Expanded(child: resetButton),
      ],
    );

    Row topRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [dateText, badge],
    );

    List<Widget> mainList = [
      topRow,
      SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [dateButton, slotDrop],
      ),
      SizedBox(height: 16),
      listBox,
      SizedBox(height: 12),
      errorWidget,
      SizedBox(height: 12),
      buttonRow,
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
      appBar: AppBar(title: Text('Appointment Booking')),
      body: padding,
    );

    return scaffold;
  }
}

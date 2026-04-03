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
  String selectedSubject = 'Maths';

  TextEditingController presentCtrl = TextEditingController();
  TextEditingController absentCtrl = TextEditingController();

  List<bool> mathsValue = [false, false, false, false, false];
  List<bool> scienceValue = [false, false, false, false, false];

  int presentCount = 0;
  int absentCount = 0;

  String errorText = '';

  @override
  void dispose() {
    presentCtrl.dispose();
    absentCtrl.dispose();
    super.dispose();
  }

  Future<void> pickDate() async {
    DateTime today = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(today.year, today.month, today.day),
      lastDate: DateTime(today.year, today.month, today.day).add(
        Duration(days: 1),
      ),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        errorText = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> mathsList = ['Vikas', 'Rohan', 'Tanisha', 'Rucha', 'Pavan'];
    List<String> scienceList = ['Harsh', 'Ved', 'Vihan', 'Chinar', 'Dev'];

    List<String> currentList = selectedSubject == 'Maths' ? mathsList : scienceList;
    List<bool> currentValue = selectedSubject == 'Maths' ? mathsValue : scienceValue;

    String dateValue = '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';

    Text dateText = Text('Date: $dateValue');
    Text subjectText = Text('Subject: $selectedSubject');

    Row topRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [dateText, subjectText],
    );

    ElevatedButton dateBtn = ElevatedButton(
      onPressed: pickDate,
      child: Text('Select Date'),
    );

    DropdownButton<String> subjectDrop = DropdownButton<String>(
      value: selectedSubject,
      items: [
        DropdownMenuItem(value: 'Maths', child: Text('Maths')),
        DropdownMenuItem(value: 'Science', child: Text('Science')),
      ],
      onChanged: (value) {
        setState(() {
          selectedSubject = value!;
          errorText = '';
        });
      },
    );

    List<Widget> studentList = [];
    for (int i = 0; i < currentList.length; i++) {
      studentList.add(
        CheckboxListTile(
          title: Text(currentList[i]),
          value: currentValue[i],
          onChanged: (val) {
            setState(() {
              currentValue[i] = val!;
            });
          },
        ),
      );
    }

    SizedBox listBox = SizedBox(
      height: 240,
      child: ListView(
        children: studentList,
      ),
    );

    Text submitText = Text('Submit');
    ElevatedButton submitBtn = ElevatedButton(
      onPressed: () {
        String presentData = '';
        String absentData = '';
        int pCount = 0;
        int aCount = 0;

        for (int i = 0; i < currentList.length; i++) {
          if (currentValue[i] == true) {
            presentData = '$presentData${currentList[i]}\n';
            pCount++;
          } else {
            absentData = '$absentData${currentList[i]}\n';
            aCount++;
          }
        }

        setState(() {
          presentCtrl.text = 'Date: $dateValue\nSubject: $selectedSubject\n\nPresent Students:\n$presentData';
          absentCtrl.text = 'Date: $dateValue\nSubject: $selectedSubject\n\nAbsent Students:\n$absentData';
          presentCount = pCount;
          absentCount = aCount;
          errorText = '';
        });
      },
      child: submitText,
    );

    Text resetText = Text('Reset');
    OutlinedButton resetBtn = OutlinedButton(
      onPressed: () {
        setState(() {
          presentCtrl.clear();
          absentCtrl.clear();
          mathsValue = [false, false, false, false, false];
          scienceValue = [false, false, false, false, false];
          presentCount = 0;
          absentCount = 0;
          selectedSubject = 'Maths';
          selectedDate = DateTime.now();
          errorText = '';
        });
      },
      child: resetText,
    );

    Row buttonRow = Row(
      children: [
        Expanded(child: submitBtn),
        SizedBox(width: 12),
        Expanded(child: resetBtn),
      ],
    );

    CircleAvatar presentBadge = CircleAvatar(
      backgroundColor: Colors.green,
      child: Text(
        presentCount.toString(),
        style: TextStyle(color: Colors.white),
      ),
    );

    CircleAvatar absentBadge = CircleAvatar(
      backgroundColor: Colors.red,
      child: Text(
        absentCount.toString(),
        style: TextStyle(color: Colors.white),
      ),
    );

    Row badgeRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [presentBadge, absentBadge],
    );

    TextField presentField = TextField(
      controller: presentCtrl,
      maxLines: 8,
      readOnly: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Present Students',
      ),
    );

    TextField absentField = TextField(
      controller: absentCtrl,
      maxLines: 8,
      readOnly: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Absent Students',
      ),
    );

    Row resultRow = Row(
      children: [
        Expanded(child: presentField),
        SizedBox(width: 12),
        Expanded(child: absentField),
      ],
    );

    Text errorWidget = Text(
      errorText,
      style: TextStyle(color: Colors.red),
      textAlign: TextAlign.center,
    );

    List<Widget> mainList = [
      topRow,
      SizedBox(height: 12),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [dateBtn, subjectDrop],
      ),
      SizedBox(height: 12),
      listBox,
      SizedBox(height: 12),
      buttonRow,
      SizedBox(height: 12),
      badgeRow,
      SizedBox(height: 12),
      resultRow,
      SizedBox(height: 8),
      errorWidget,
    ];

    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: mainList,
    );

    Padding padding = Padding(
      padding: EdgeInsets.all(12),
      child: column,
    );

    SingleChildScrollView scrollView = SingleChildScrollView(
      child: padding,
    );

    Scaffold scaffold = Scaffold(
      appBar: AppBar(title: Text('Attendance')),
      body: scrollView,
    );

    return scaffold;
  }
}

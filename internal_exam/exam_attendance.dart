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
  String subject = 'Maths';

  List<String> maths = ['Vikas', 'Rohan', 'Tanisha', 'Rucha', 'Pavan'];
  List<String> science = ['Harsh', 'Ved', 'Vihan', 'Chinar', 'Dev'];

  List<bool> m = [false, false, false, false, false];
  List<bool> s = [false, false, false, false, false];

  TextEditingController presentCtrl = TextEditingController();
  TextEditingController absentCtrl = TextEditingController();

  int presentCount = 0;
  int absentCount = 0;

  @override
  void dispose() {
    presentCtrl.dispose();
    absentCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> names = subject == 'Maths' ? maths : science;
    List<bool> checks = subject == 'Maths' ? m : s;

    String d = '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';

    List<Widget> tiles = [];
    for (int i = 0; i < names.length; i++) {
      tiles.add(
        CheckboxListTile(
          title: Text(names[i]),
          value: checks[i],
          onChanged: (value) {
            setState(() {
              checks[i] = value!;
            });
          },
        ),
      );
    }

    ElevatedButton submit = ElevatedButton(
      onPressed: () {
        String p = '';
        String a = '';
        int pc = 0;
        int ac = 0;

        for (int i = 0; i < names.length; i++) {
          if (checks[i]) {
            p = '$p${names[i]}\n';
            pc++;
          } else {
            a = '$a${names[i]}\n';
            ac++;
          }
        }

        setState(() {
          presentCtrl.text = 'Date: $d\nSubject: $subject\n\nPresent:\n$p';
          absentCtrl.text = 'Date: $d\nSubject: $subject\n\nAbsent:\n$a';
          presentCount = pc;
          absentCount = ac;
        });
      },
      child: Text('Submit'),
    );

    OutlinedButton reset = OutlinedButton(
      onPressed: () {
        setState(() {
          m = [false, false, false, false, false];
          s = [false, false, false, false, false];
          presentCtrl.clear();
          absentCtrl.clear();
          presentCount = 0;
          absentCount = 0;
        });
      },
      child: Text('Reset'),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Attendance')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Date: $d'), Text('Subject: $subject')],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      DateTime now = DateTime.now();
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: now,
                        firstDate: DateTime(now.year, now.month, now.day),
                        lastDate: DateTime(now.year, now.month, now.day).add(Duration(days: 1)),
                      );
                      if (picked != null) {
                        setState(() {
                          selectedDate = picked;
                        });
                      }
                    },
                    child: Text('Pick Date'),
                  ),
                  DropdownButton<String>(
                    value: subject,
                    items: ['Maths', 'Science']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        subject = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 8),
              SizedBox(height: 220, child: ListView(children: tiles)),
              Row(children: [Expanded(child: submit), SizedBox(width: 12), Expanded(child: reset)]),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(backgroundColor: Colors.green, child: Text('$presentCount')),
                  CircleAvatar(backgroundColor: Colors.red, child: Text('$absentCount')),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: presentCtrl,
                      maxLines: 7,
                      readOnly: true,
                      decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Present'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: absentCtrl,
                      maxLines: 7,
                      readOnly: true,
                      decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Absent'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

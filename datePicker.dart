import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController idCtrl = TextEditingController();
  String selectedId = "";
  DateTime? selectedDate;

  // skills
  bool flutter = false;
  bool java = false;
  bool dotnet = false;

  @override
  void dispose() {
    idCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    InputDecoration idDec = InputDecoration(
      border: OutlineInputBorder(),
      labelText: "Enter ID",
      hintText: "eg 25MCA001",
      prefixIcon: Icon(Icons.person),
    );

    TextField stdIdField = TextField(
      controller: idCtrl,
      decoration: idDec,
      onChanged: (text) {
        setState(() {
          selectedId = text;
        });
      },
    );

    ElevatedButton dateBtn = ElevatedButton(
      onPressed: pickDate,
      child: Text("Select Birth Date"),
    );

    Text dateText = Text(
      selectedDate == null
          ? "No date selected"
          : "Selected: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
    );

    // ✅ Checkboxes
    Column skillBox = Column(
      children: [
        CheckboxListTile(
          title: Text("Flutter"),
          value: flutter,
          onChanged: (val) {
            setState(() {
              flutter = val!;
            });
          },
        ),
        CheckboxListTile(
          title: Text("Java"),
          value: java,
          onChanged: (val) {
            setState(() {
              java = val!;
            });
          },
        ),
        CheckboxListTile(
          title: Text(".NET"),
          value: dotnet,
          onChanged: (val) {
            setState(() {
              dotnet = val!;
            });
          },
        ),
      ],
    );

    //Prepare skills string
    String skills = "";
    if (flutter) skills += "Flutter, ";
    if (java) skills += "Java, ";
    if (dotnet) skills += ".NET, ";
    if (skills.endsWith(", ")) {
      skills = skills.substring(0, skills.length - 2);
    }

    // Output box
    Container outputBox = Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Text(
        "Student Id: $selectedId\n"
            "Date of Birth: ${selectedDate == null ? "" : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"}\n"
            "Skills: $skills",
      ),
    );

    Column column = Column(
      children: [
        stdIdField,
        SizedBox(height: 10),
        dateBtn,
        dateText,
        skillBox,
        outputBox,
      ],
    );

    Scaffold scaffold = Scaffold(
      appBar: AppBar(title: Text("Form")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: column,
      ),
    );

    return scaffold;
  }

  Future<void> pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }
}
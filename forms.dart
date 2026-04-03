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
  TextEditingController firstCtrl = TextEditingController();
  TextEditingController lastCtrl = TextEditingController();

  String gender = 'Male';
  bool english = true;
  bool gujarati = false;
  bool hindi = false;

  String details = '';

  @override
  void dispose() {
    firstCtrl.dispose();
    lastCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextField firstField = TextField(
      controller: firstCtrl,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter firstname',
      ),
    );

    TextField lastField = TextField(
      controller: lastCtrl,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter lastname',
      ),
    );

    RadioListTile<String> maleRadio = RadioListTile<String>(
      title: Text('Male'),
      value: 'Male',
      groupValue: gender,
      onChanged: (value) {
        setState(() {
          gender = value!;
        });
      },
    );

    RadioListTile<String> femaleRadio = RadioListTile<String>(
      title: Text('Female'),
      value: 'Female',
      groupValue: gender,
      onChanged: (value) {
        setState(() {
          gender = value!;
        });
      },
    );

    RadioListTile<String> otherRadio = RadioListTile<String>(
      title: Text('Other'),
      value: 'Other',
      groupValue: gender,
      onChanged: (value) {
        setState(() {
          gender = value!;
        });
      },
    );

    CheckboxListTile englishBox = CheckboxListTile(
      title: Text('English'),
      value: english,
      onChanged: (value) {
        setState(() {
          english = value!;
        });
      },
    );

    CheckboxListTile gujaratiBox = CheckboxListTile(
      title: Text('Gujarati'),
      value: gujarati,
      onChanged: (value) {
        setState(() {
          gujarati = value!;
        });
      },
    );

    CheckboxListTile hindiBox = CheckboxListTile(
      title: Text('Hindi'),
      value: hindi,
      onChanged: (value) {
        setState(() {
          hindi = value!;
        });
      },
    );

    Text registerText = Text('Register');
    ElevatedButton registerButton = ElevatedButton(
      onPressed: () {
        String lang = '';
        if (english) {
          lang = 'English';
        }
        if (gujarati) {
          if (lang.isEmpty) {
            lang = 'Gujarati';
          } else {
            lang = '$lang, Gujarati';
          }
        }
        if (hindi) {
          if (lang.isEmpty) {
            lang = 'Hindi';
          } else {
            lang = '$lang, Hindi';
          }
        }
        if (lang.isEmpty) {
          lang = 'None';
        }

        setState(() {
          details = 'Firstname: ${firstCtrl.text}\n'
              'Lastname: ${lastCtrl.text}\n'
              'Gender: $gender\n'
              'Languages known: $lang';
        });
      },
      child: registerText,
    );

    Text detailsText = Text(details);

    List<Widget> mainList = [
      Text('Firstname'),
      SizedBox(height: 8),
      firstField,
      SizedBox(height: 16),
      Text('Lastname'),
      SizedBox(height: 8),
      lastField,
      SizedBox(height: 16),
      Text('Gender'),
      maleRadio,
      femaleRadio,
      otherRadio,
      SizedBox(height: 16),
      Text('Languages known'),
      englishBox,
      gujaratiBox,
      hindiBox,
      SizedBox(height: 16),
      registerButton,
      SizedBox(height: 16),
      detailsText,
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
      appBar: AppBar(title: Text('Registration Form')),
      body: SingleChildScrollView(child: padding),
    );

    return scaffold;
  }
}

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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstCtrl = TextEditingController();
  TextEditingController lastCtrl = TextEditingController();

  String gender = 'Male';
  bool english = true;
  bool gujarati = false;
  bool hindi = false;

  String result = '';

  @override
  void dispose() {
    firstCtrl.dispose();
    lastCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextFormField firstField = TextFormField(
      controller: firstCtrl,
      decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Firstname'),
      validator: (value) => value == null || value.trim().isEmpty ? 'Enter firstname' : null,
    );

    TextFormField lastField = TextFormField(
      controller: lastCtrl,
      decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Lastname'),
      validator: (value) => value == null || value.trim().isEmpty ? 'Enter lastname' : null,
    );

    ElevatedButton registerBtn = ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          List<String> langs = [];
          if (english) langs.add('English');
          if (gujarati) langs.add('Gujarati');
          if (hindi) langs.add('Hindi');

          setState(() {
            result = 'Firstname: ${firstCtrl.text}\n'
                'Lastname: ${lastCtrl.text}\n'
                'Gender: $gender\n'
                'Languages: ${langs.isEmpty ? 'None' : langs.join(', ')}';
          });
        }
      },
      child: Text('Register'),
    );

    Form form = Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          firstField,
          SizedBox(height: 12),
          lastField,
          SizedBox(height: 12),
          RadioListTile<String>(
            title: Text('Male'),
            value: 'Male',
            groupValue: gender,
            onChanged: (value) => setState(() => gender = value!),
          ),
          RadioListTile<String>(
            title: Text('Female'),
            value: 'Female',
            groupValue: gender,
            onChanged: (value) => setState(() => gender = value!),
          ),
          RadioListTile<String>(
            title: Text('Other'),
            value: 'Other',
            groupValue: gender,
            onChanged: (value) => setState(() => gender = value!),
          ),
          CheckboxListTile(
            title: Text('English'),
            value: english,
            onChanged: (value) => setState(() => english = value!),
          ),
          CheckboxListTile(
            title: Text('Gujarati'),
            value: gujarati,
            onChanged: (value) => setState(() => gujarati = value!),
          ),
          CheckboxListTile(
            title: Text('Hindi'),
            value: hindi,
            onChanged: (value) => setState(() => hindi = value!),
          ),
          registerBtn,
          SizedBox(height: 12),
          Text(result),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Form Registration')),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(16), child: form),
      ),
    );
  }
}

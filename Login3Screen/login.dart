import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  @override
  void dispose() {
    userCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Text userText = Text('Username');
    TextField userField = TextField(
      controller: userCtrl,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter username',
      ),
    );

    Text passText = Text('Password');
    TextField passField = TextField(
      controller: passCtrl,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter password',
      ),
    );

    ElevatedButton loginButton = ElevatedButton(
      onPressed: () {
        String username = userCtrl.text.trim();
        String password = passCtrl.text.trim();

        if (username == 'admin' && password == 'admin') {
          Navigator.pushReplacementNamed(context, '/welcome');
        } else {
          Navigator.pushReplacementNamed(context, '/error');
        }
      },
      child: Text('Login'),
    );

    List<Widget> bodyList = [
      userText,
      SizedBox(height: 8),
      userField,
      SizedBox(height: 16),
      passText,
      SizedBox(height: 8),
      passField,
      SizedBox(height: 20),
      loginButton,
    ];

    Column column = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: bodyList,
    );

    Padding padding = Padding(
      padding: EdgeInsets.all(16),
      child: column,
    );

    Scaffold scaffold = Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: padding,
    );

    return scaffold;
  }
}

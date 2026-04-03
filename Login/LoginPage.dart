import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    Text text = Text(
      "Welcome",
      style: TextStyle(fontSize: 24),
    );

    Center center = Center(child: text);

    Scaffold scaffold = Scaffold(
      body: center,
    );

    return scaffold;
  }
}
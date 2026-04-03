import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Center center = Center(
      child: Text(
        'Welcome',
        style: TextStyle(fontSize: 24),
      ),
    );

    Scaffold scaffold = Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: center,
    );

    return scaffold;
  }
}

import 'package:flutter/material.dart';
import 'LoginPage.dart';   // ✅ fixed
import 'welcome.dart';

void main() {
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {

    MaterialApp app = MaterialApp(
      home: LoginPage(),
      routes: {
        '/': (context) => LoginPage(),
        '/welcome': (context) => WelcomePage(),
      },
    );

    return app;
  }
}
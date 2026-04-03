import 'package:flutter/material.dart';
import 'LoginPage.dart';   // ✅ fixed
import 'welcome.dart';

class Root extends StatelessWidget {
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
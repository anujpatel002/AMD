import 'package:flutter/material.dart';
import 'login.dart';
import 'welcome.dart';
import 'errormsg.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const LoginPage(),
    routes: {
      '/login': (context) => const LoginPage(),
      '/welcome': (context) => const WelcomePage(),
      '/error': (context) => const ErrorMsgPage(),
    },
  ));
}

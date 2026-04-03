import 'package:flutter/material.dart';

class ErrorMsgPage extends StatelessWidget {
  const ErrorMsgPage({super.key});

  @override
  Widget build(BuildContext context) {
    Text errorText = Text(
      'Invalid username or password',
      style: TextStyle(fontSize: 20, color: Colors.red),
      textAlign: TextAlign.center,
    );

    ElevatedButton tryAgainButton = ElevatedButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/login');
      },
      child: Text('Try again'),
    );

    Column column = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        errorText,
        SizedBox(height: 20),
        tryAgainButton,
      ],
    );

    Scaffold scaffold = Scaffold(
      appBar: AppBar(title: Text('Error')),
      body: Center(child: column),
    );

    return scaffold;
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/login': (context) => const LoginPage(),
      '/welcome': (context) => const WelcomePage(),
      '/error': (context) => const ErrorPage(),
    },
  ));
}

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
    TextField userField = TextField(
      controller: userCtrl,
      decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Username'),
    );

    TextField passField = TextField(
      controller: passCtrl,
      obscureText: true,
      decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Password'),
    );

    ElevatedButton loginButton = ElevatedButton(
      onPressed: () {
        String user = userCtrl.text.trim();
        String pass = passCtrl.text.trim();

        if (user == 'admin' && pass == 'admin') {
          Navigator.pushReplacementNamed(context, '/welcome');
        } else {
          Navigator.pushReplacementNamed(context, '/error');
        }
      },
      child: Text('Login'),
    );

    Column bodyColumn = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        userField,
        SizedBox(height: 12),
        passField,
        SizedBox(height: 20),
        loginButton,
      ],
    );

    Scaffold scaffold = Scaffold(
      appBar: AppBar(title: Text('Login Flow')),
      body: Padding(padding: EdgeInsets.all(16), child: bodyColumn),
    );

    return scaffold;
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: Center(child: Text('Welcome', style: TextStyle(fontSize: 24))),
    );
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    ElevatedButton tryAgain = ElevatedButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/login');
      },
      child: Text('Try again'),
    );

    Column column = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Invalid credentials', style: TextStyle(color: Colors.red, fontSize: 20)),
        SizedBox(height: 16),
        tryAgain,
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text('Error')),
      body: Center(child: column),
    );
  }
}

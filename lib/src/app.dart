import 'package:flutter/material.dart';
import '../src/screens/login_screen.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: LoginScreen(),
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text('LoginScreen'),
          ),
        ),
      ),
    );
  }
}

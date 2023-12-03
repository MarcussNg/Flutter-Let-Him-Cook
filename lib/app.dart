import 'package:flutter/material.dart';
import 'package:let_him_cook/HomePage.dart';

class App extends StatelessWidget {
  final String appName;

  const App(this.appName, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

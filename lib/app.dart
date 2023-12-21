import 'package:flutter/material.dart';
import 'package:let_him_cook/utils/router/app_router.dart';

class App extends StatelessWidget {
  final String appName;

  const App(this.appName, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

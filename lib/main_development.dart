import 'package:flutter/material.dart';
import 'package:let_him_cook/app.dart';
import 'package:let_him_cook/utils/enum/app_enums.dart';
import 'package:let_him_cook/utils/init_manager.dart';

Future<void> main() async {
  // Init function called to startup necessary services
  init(EnvironmentType.DEVELOPMENT);

  // Run the app
  runApp(const App("App - Development"));
}

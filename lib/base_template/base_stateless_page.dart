import 'package:flutter/material.dart';

abstract class BaseStatelessPage extends StatelessWidget {
  const BaseStatelessPage({super.key});

  // Widget params
  Widget body();
  AppBar? appbar() => null;
  Widget? floatingActionButton() => null;
  BottomNavigationBar? bottomNavigationBar() => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: body(),
      floatingActionButton: floatingActionButton(),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}

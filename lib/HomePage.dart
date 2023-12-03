import 'package:flutter/material.dart';
import 'package:let_him_cook/base_template/base_stateful_page.dart';

class HomePage extends BaseStatefulPage {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseStatefulState<HomePage> {
  @override
  Widget body() {
    return const Column(
      children: [
        Text("This is home"),
      ],
    );
  }
}

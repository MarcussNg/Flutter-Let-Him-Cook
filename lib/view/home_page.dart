import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_him_cook/base_template/base_stateful_page.dart';
import 'package:let_him_cook/utils/router/app_router.dart';

class HomePage extends BaseStatefulPage {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseStatefulState<HomePage> {
  @override
  Widget body() {
    return Column(
      children: [
        GestureDetector(
          onTap: () => context.go(AppRouter.favoritesPage),
          child: const Text("Press me to go to favourites"),
        )
      ],
    );
  }
}

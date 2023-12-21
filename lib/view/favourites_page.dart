import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:let_him_cook/base_template/base_stateful_page.dart';

class FavouritesPage extends BaseStatefulPage {
  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends BaseStatefulState<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    return const Text("This is favorites page");
  }

  @override
  Widget body() {
    // TODO: implement body
    throw UnimplementedError();
  }
}

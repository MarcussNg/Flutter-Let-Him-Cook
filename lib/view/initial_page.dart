import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_him_cook/base_template/base_stateful_page.dart';
import 'package:let_him_cook/utils/router/app_router.dart';
import 'package:let_him_cook/utils/shared_preference_manager.dart';

class InitialPage extends BaseStatefulPage {
  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends BaseStatefulState<InitialPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _actionProceed();
    });
  }

  @override
  Widget body() {
    return Container(child: Center(child: CircularProgressIndicator()));
  }

  void _actionProceed({bool shouldPop = false}) {
    if (shouldPop) Navigator.pop(context);
    context.go(AppRouter.mainTabPage);
  }
}

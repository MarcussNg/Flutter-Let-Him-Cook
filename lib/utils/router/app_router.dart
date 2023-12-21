import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_him_cook/view/favourites_page.dart';
import 'package:let_him_cook/view/home_page.dart';
import 'package:let_him_cook/view/initial_page.dart';
import 'package:let_him_cook/view/main_tab_page.dart';
import 'package:let_him_cook/view/settings_page.dart';

class AppRouter {
  static const String mainTabPage = "/mainTabPage";
  static const String homePage = "/homePage";
  static const String favoritesPage = "/favouritesPage";
  static const String settingsPage = '/settingsPage';
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(path: '/', builder: (context, state) => InitialPage()),
    GoRoute(
      name: AppRouter.mainTabPage,
      path: AppRouter.mainTabPage,
      builder: (BuildContext context, GoRouterState state) {
        return MainTabPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: AppRouter.homePage,
          builder: (BuildContext context, GoRouterState state) {
            return HomePage();
          },
        ),
        GoRoute(
          path: AppRouter.favoritesPage,
          builder: (BuildContext context, GoRouterState state) {
            return FavouritesPage();
          },
        ),
        GoRoute(
          path: AppRouter.settingsPage,
          builder: (BuildContext context, GoRouterState state) {
            return SettingsPage();
          },
        ),
      ],
    ),
  ],
);

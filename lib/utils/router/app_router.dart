import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_him_cook/view/FavouritesPage.dart';
import 'package:let_him_cook/view/HomePage.dart';

class AppRouter {
  static const String homePage = "HomePage";
  static const String favoritesPage = "/FavoritesPage";
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: AppRouter.favoritesPage,
          builder: (BuildContext context, GoRouterState state) {
            return FavouritesPage();
          },
        ),
      ],
    ),
  ],
);

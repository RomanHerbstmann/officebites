import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:office_bites/screens/home_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen(title: 'Flutter Demo Home Page');
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen(title: 'Flutter Demo Home Page');
          },
        ),
      ],
    ),
  ],
);

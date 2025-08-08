import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_testing/core/router/app_routes.dart';
import 'package:riverpod_testing/core/router/screen_exports.dart';

// GoRouter configuration
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final router = GoRouter(
  initialLocation: AppRoutes.playground_screen,
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  observers: [
    // APlusAnalyticsObserver(FirebaseAnalytics.instance),
  ],
  routes: [
    
    GoRoute(
      path: AppRoutes.todo_list_screen,
      name: AppRoutes.todo_list_screen,
      pageBuilder: (context, state) => CupertinoPage(child: TodoListScreen()),
    ),

    GoRoute(
      path: AppRoutes.playground_screen,
      name: AppRoutes.playground_screen,
      pageBuilder: (context, state) => CupertinoPage(child: PlaygroundScreen()),
    ),

  ],
);


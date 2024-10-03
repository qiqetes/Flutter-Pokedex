import 'package:flutter/material.dart';
import 'package:pokedex_flutter/features/home/home_screen.dart';
import 'package:pokedex_flutter/features/navigation/navigation_shell.dart';
import 'package:pokedex_flutter/features/splash_screen/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  // final routes = ref.watch(routesProvider);
  // print(routes);
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => NavigationShell(child: child),
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/pokemon/:id',
            builder: (context, state) => const Center(child: Text('Pokemon')),
          ),
          GoRoute(
            path: '/type/:id',
            builder: (context, state) =>
                Center(child: Text(state.pathParameters['id']!)),
          ),
          GoRoute(
            path: '/captured',
            builder: (context, state) => const Center(child: Text('Captued')),
          ),
        ],
      ),
    ],
  );
});

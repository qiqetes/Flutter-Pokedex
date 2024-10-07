import 'package:pokedex_flutter/features/caputred_screen/captured_screen.dart';
import 'package:pokedex_flutter/features/home_screen/home_screen.dart';
import 'package:pokedex_flutter/features/navigation/navigation_shell.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_flutter/features/pokemon/models/pokemon.dart';
import 'package:pokedex_flutter/features/pokemon/pokemon_screen.dart';
import 'package:pokedex_flutter/features/type_screen/type_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) => NavigationShell(child: child),
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
              path: '/pokemon/:id',
              builder: (context, state) {
                // final pokemon = state.extra
                //     as Pokemon; // More beautful option could be doing a Provider for the currentPokemon,
                // this was faster
                // PokemonScreen(),
                return PokemonScreen(pokemonId: state.pathParameters['id']!);
              }),
          GoRoute(
            path: '/type/:id',
            builder: (context, state) =>
                TypeScreen(typeString: state.pathParameters['id']!),
          ),
          GoRoute(
            path: '/captured',
            builder: (context, state) => const CapturedScreen(),
          ),
        ],
      ),
    ],
  );
});

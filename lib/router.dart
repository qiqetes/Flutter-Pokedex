import 'package:pokedex_flutter/features/caputred_screen/captured_screen.dart';
import 'package:pokedex_flutter/features/home_screen/home_screen.dart';
import 'package:pokedex_flutter/features/navigation/navigation_shell.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_flutter/features/pokemon/pokemon_screen.dart';
import 'package:pokedex_flutter/features/pokemon/providers/current_pokemon_provider.dart';
import 'package:pokedex_flutter/features/type_screen/type_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) => NavigationShell(child: child),
        routes: [
          GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
          GoRoute(
            path: '/pokemon/:id',
            builder: (context, state) {
              return ProviderScope(
                overrides: [
                  currentPokemonProvider.overrideWithValue(
                    ref.watch(
                      pokemonByIdProvider(
                        int.parse(state.pathParameters['id']!),
                      ),
                    ),
                  ),
                ],
                child: PokemonScreen(
                  pokemonId: int.parse(state.pathParameters['id']!),
                ),
              );
            },
          ),
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

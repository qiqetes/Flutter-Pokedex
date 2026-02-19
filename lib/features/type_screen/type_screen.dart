import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/features/pokemon/components/pokemon_list.dart';
import 'package:pokedex_flutter/features/pokemon/models/poke_type.dart';
import 'package:pokedex_flutter/features/type_screen/type_view_model.dart';
import 'package:pokedex_flutter/ui/not_found_widget.dart';

class TypeScreen extends ConsumerWidget {
  TypeScreen({super.key, required String typeString})
    : type = PokeType.fromJson(typeString);
  final PokeType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonState = ref.watch(typeViewModelProvider(type));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: type.color,
        title: Text(type.name.toUpperCase()),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(typeViewModelProvider(type).notifier).loadNextPage();
            },
          ),
        ],
      ),
      body: switch (pokemonState) {
        AsyncError() => const Center(child: NotFoundWidget()),
        AsyncData(:final value) => PokemonList(
          pokemons: value,
          onReachListEnd: () {
            ref.read(typeViewModelProvider(type).notifier).loadNextPage();
          },
        ),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}

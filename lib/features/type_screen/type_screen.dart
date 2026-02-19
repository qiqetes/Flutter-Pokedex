import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/features/pokemon/components/pokemon_list.dart';
import 'package:pokedex_flutter/features/pokemon/models/poke_type.dart';
import 'package:pokedex_flutter/features/pokemon/providers/pokemon_provider.dart';
import 'package:pokedex_flutter/ui/not_found_widget.dart';

class TypeScreen extends StatelessWidget {
  TypeScreen({super.key, required String typeString}) : type = PokeType.fromJson(typeString);
  final PokeType type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: type.color,
        title: Text(type.name.toUpperCase()),
        actions: [
          Consumer(
            builder: (context, ref, child) => IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                ref.read(pokemonControllerProvider(type: type).notifier).fetchNextPage();
              },
            ),
          ),
        ],
      ),
      body: Consumer(builder: (context, ref, child) {
        final pokemonController = ref.watch(pokemonControllerProvider(type: type));

        switch (pokemonController) {
          case AsyncError():
            return const Center(child: NotFoundWidget());

          case AsyncData(:final value):
            return PokemonList(
                pokemons: value,
                onReachListEnd: () {
                  ref.read(pokemonControllerProvider(type: type).notifier).fetchNextPage();
                });
          case _:
            return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}

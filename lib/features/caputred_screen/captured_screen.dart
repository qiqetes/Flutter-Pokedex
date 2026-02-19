import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/features/pokemon/components/pokemon_list.dart';
import 'package:pokedex_flutter/features/pokemon/models/pokemon.dart';
import 'package:pokedex_flutter/features/pokemon/providers/captured_provider.dart';
import 'package:pokedex_flutter/features/pokemon/providers/pokedex_palette_provider.dart';

class CapturedScreen extends ConsumerWidget {
  const CapturedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = ref.watch(pokedexPaletteProvider);
    List<Pokemon> capturedPokemons = ref.watch(capturedPokemonProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: palette.primary,
        title: const Text('Captured Pokémons'),
      ),
      body: PokemonList(pokemons: capturedPokemons),
    );
  }
}

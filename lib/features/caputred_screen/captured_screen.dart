import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/features/caputred_screen/captured_view_model.dart';
import 'package:pokedex_flutter/features/pokemon/components/pokemon_list.dart';

class CapturedScreen extends ConsumerWidget {
  const CapturedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewState = ref.watch(capturedViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: viewState.palette.primary,
        title: const Text('Captured Pokémons'),
      ),
      body: PokemonList(pokemons: viewState.pokemons),
    );
  }
}

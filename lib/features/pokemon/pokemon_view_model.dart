import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter/features/pokemon/models/pokemon.dart';
import 'package:pokedex_flutter/features/pokemon/providers/captured_provider.dart';
import 'package:pokedex_flutter/features/pokemon/providers/current_pokemon_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_view_model.freezed.dart';
part 'pokemon_view_model.g.dart';

/// Aggregated state exposed to [PokemonScreen].
@freezed
abstract class PokemonDetailState with _$PokemonDetailState {
  const factory PokemonDetailState({
    required Pokemon pokemon,
    required bool isCaptured,
  }) = _PokemonDetailState;
}

@Riverpod(dependencies: [currentPokemon])
class PokemonDetailViewModel extends _$PokemonDetailViewModel {
  @override
  PokemonDetailState build() {
    final pokemon = ref.watch(currentPokemonProvider);
    final isCaptured = ref.watch(capturedPokemonProvider).contains(pokemon);
    return PokemonDetailState(pokemon: pokemon, isCaptured: isCaptured);
  }

  void toggleCapture() {
    ref.read(capturedPokemonProvider.notifier).capture(state.pokemon);
  }
}

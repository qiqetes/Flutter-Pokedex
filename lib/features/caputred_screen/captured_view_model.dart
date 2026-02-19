import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter/features/pokemon/models/pokemon.dart';
import 'package:pokedex_flutter/features/pokemon/providers/captured_provider.dart';
import 'package:pokedex_flutter/features/pokemon/providers/pokedex_palette_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'captured_view_model.freezed.dart';
part 'captured_view_model.g.dart';

@freezed
abstract class CapturedViewState with _$CapturedViewState {
  const factory CapturedViewState({
    required List<Pokemon> pokemons,
    required PokedexPalette palette,
  }) = _CapturedViewState;
}

@riverpod
CapturedViewState capturedViewModel(Ref ref) {
  final pokemons = ref.watch(capturedPokemonProvider);
  final palette = ref.watch(pokedexPaletteProvider);
  return CapturedViewState(pokemons: pokemons, palette: palette);
}

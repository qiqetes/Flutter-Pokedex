import 'dart:convert';
import 'package:pokedex_flutter/features/pokemon/models/poke_type.dart';
import 'package:pokedex_flutter/features/pokemon/models/pokemon.dart';
import 'package:pokedex_flutter/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'captured_provider.g.dart';

@riverpod
class CapturedPokemon extends _$CapturedPokemon {
  @override
  List<Pokemon> build() {
    final jsonRaw = ref.read(sharedPreferencesProvider).getString('captured');
    final json = jsonDecode(jsonRaw ?? '[]') as List;
    final pokemons = json.map((e) => Pokemon.fromJson(e)).toList();

    ref.onDispose(() {
      _save();
    });

    return pokemons;
  }

  void capture(Pokemon pokemon) {
    if (state.any((p) => p.id == pokemon.id)) {
      _release(pokemon.id);
    } else {
      state = [...state, pokemon];
    }

    _save();
  }

  void _save() {
    ref
        .read(sharedPreferencesProvider)
        .setString('captured', jsonEncode(state));
  }

  void _release(int id) {
    state = state.where((pokemon) => pokemon.id != id).toList();
  }
}

@riverpod
PokeType predominantType(PredominantTypeRef ref) {
  List<List<PokeType>> typesRaw =
      ref.watch(capturedPokemonProvider).map((p) => p.types).toList();
  List<PokeType> types = typesRaw.expand((element) => element).toList();

  if (types.isEmpty) {
    return PokeType.normal;
  }

  final Map<PokeType, int> typeCount = types.fold(
    <PokeType, int>{},
    (Map<PokeType, int> acc, type) {
      acc[type] = (acc[type] ?? 0) + 1;
      return acc;
    },
  );

  final predominantType =
      typeCount.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  return predominantType;
}

import 'dart:convert';
import 'package:pokedex_flutter/features/pokemon/models/poke_type.dart';
import 'package:pokedex_flutter/features/pokemon/models/pokemon.dart';
import 'package:pokedex_flutter/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'captured_provider.g.dart';

@riverpod
class CapturedPokemon extends _$CapturedPokemon {
  // Keep a direct reference so _save works even during container disposal.
  late final SharedPreferences _prefs;

  @override
  List<Pokemon> build() {
    _prefs = ref.read(sharedPreferencesProvider);
    final jsonRaw = _prefs.getString('captured');
    final json = jsonDecode(jsonRaw ?? '[]') as List;
    final pokemons = json.map((e) => Pokemon.fromJson(e)).toList();

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
    _prefs.setString('captured', jsonEncode(state));
  }

  void _release(int id) {
    state = state.where((pokemon) => pokemon.id != id).toList();
  }
}

/// Returns null if no captured or no predominant type
@riverpod
PokeType? predominantType(Ref ref) {
  List<List<PokeType>> typesRaw = ref
      .watch(capturedPokemonProvider)
      .map((p) => p.types)
      .toList();
  List<PokeType> types = typesRaw.expand((element) => element).toList();

  if (types.isEmpty) {
    return null;
  }

  final Map<PokeType, int> typeCount = types.fold(<PokeType, int>{}, (
    Map<PokeType, int> acc,
    type,
  ) {
    acc[type] = (acc[type] ?? 0) + 1;
    return acc;
  });
  final int maxCount = typeCount.values.reduce((a, b) => a > b ? a : b);
  final predominantTypes = typeCount.entries
      .where((entry) => entry.value == maxCount)
      .map((entry) => entry.key)
      .toList();

  if (predominantTypes.length != 1) {
    return null;
  }

  return predominantTypes.first;
}

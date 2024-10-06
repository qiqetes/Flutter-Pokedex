import 'dart:async';

import 'package:pokedex_flutter/features/pokemon/models/poke_type.dart';
import 'package:pokedex_flutter/features/pokemon/models/pokemon.dart';
import 'package:pokedex_flutter/features/pokemon/pokemon_repository.dart';
import 'package:pokedex_flutter/gql_pokeapi_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'pokemon_provider.g.dart';

final pokemonRepositoryProvider = Provider<PokemonRepository>((ref) {
  var client = ref.watch(pokeApiClient);
  return PokemonRepository(client);
});

@riverpod
class PokemonController extends _$PokemonController {
  late final PokemonRepository _repository;
  Timer? _debounce;
  int cursor = 0;

  @override
  Future<List<Pokemon>> build({PokeType? type, String? searchName}) {
    _repository = ref.watch(pokemonRepositoryProvider);
    return _fetchPokemon(type, searchName);
  }

  Future<List<Pokemon>> _fetchPokemon(PokeType? type, String? name) async {
    try {
      final res = await _repository.fetchPokemons(
        types: type != null ? [type] : null,
        name: name,
        offset: cursor,
      );
      ref.keepAlive();
      cursor += 10;
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchNextPage() async {
    if (!_canFetch) return;
    _setDebounce();

    final newState = await AsyncValue.guard(() async {
      return [...?state.value, ...await _fetchPokemon(type, searchName)];
    });
    state = newState;
  }

  bool get _canFetch => _debounce == null || !_debounce!.isActive;
  void _setDebounce() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {});
  }
}

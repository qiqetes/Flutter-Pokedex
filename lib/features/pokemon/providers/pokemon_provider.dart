import 'dart:async';

import 'package:pokedex_flutter/features/pokemon/models/poke_type.dart';
import 'package:pokedex_flutter/features/pokemon/models/pokemon.dart';
import 'package:pokedex_flutter/features/pokemon/models/search_filter.dart';
import 'package:pokedex_flutter/features/pokemon/pokemon_repository.dart';
import 'package:pokedex_flutter/features/pokemon/providers/search_filter_cache_notifier_provider.dart';
import 'package:pokedex_flutter/gql_pokeapi_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'pokemon_provider.g.dart';

@riverpod
PokemonRepository pokemonRepository(Ref ref) {
  var client = ref.watch(pokeApiClient);
  return PokemonRepository(client);
}

@riverpod
class PokemonController extends _$PokemonController {
  late final PokemonRepository _repository;
  Timer? _debounce;
  int cursor = 0;

  @override
  Future<List<Pokemon>> build({PokeType? type, String? searchName}) async {
    _repository = ref.watch(pokemonRepositoryProvider);
    final List<Pokemon> pokemonsInSearch = await _fetchPokemon(
      type,
      searchName,
    );

    ref
        .watch(searchFilterCacheProvider.notifier)
        .addFilter(SearchFilter(name: searchName, type: type));

    ref.onDispose(() {
      _debounce?.cancel();
      ref
          .read(searchFilterCacheProvider.notifier)
          .removeFilter(SearchFilter(name: searchName, type: type));
    });

    return pokemonsInSearch;
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

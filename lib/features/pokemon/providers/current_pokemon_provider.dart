import 'package:collection/collection.dart';
import 'package:pokedex_flutter/features/pokemon/providers/pokemon_provider.dart';
import 'package:pokedex_flutter/features/pokemon/providers/search_filter_cache_notifier_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pokedex_flutter/features/pokemon/models/pokemon.dart';
part 'current_pokemon_provider.g.dart';

@riverpod
Pokemon currentPokemon(Ref ref) {
  throw UnimplementedError('This provider should be overridden');
}

@riverpod
Pokemon pokemonById(Ref ref, int pokemonId) {
  final cachedFilters = ref.watch(searchFilterCacheProvider);
  for (final filter in cachedFilters) {
    final pokemons = ref.watch(
      pokemonControllerProvider(type: filter.type, searchName: filter.name),
    );
    if (!pokemons.hasValue) continue;
    final pokemon = pokemons.value!.firstWhereOrNull((p) => p.id == pokemonId);
    if (pokemon != null) {
      return pokemon;
    }
  }

  // As a fallback we could fetch the pokemon from api, useful in web, where
  // the user might open a pokemon detail page directly without going
  // through the list.
  throw Exception('Pokemon with id $pokemonId not found in cache');
}

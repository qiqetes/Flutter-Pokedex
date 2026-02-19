import 'package:pokedex_flutter/features/pokemon/models/poke_type.dart';
import 'package:pokedex_flutter/features/pokemon/models/pokemon.dart';
import 'package:pokedex_flutter/features/pokemon/providers/pokemon_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'type_view_model.g.dart';

@riverpod
class TypeViewModel extends _$TypeViewModel {
  @override
  AsyncValue<List<Pokemon>> build(PokeType type) {
    return ref.watch(pokemonControllerProvider(type: type));
  }

  Future<void> loadNextPage() async {
    await ref
        .read(pokemonControllerProvider(type: type).notifier)
        .fetchNextPage();
  }
}

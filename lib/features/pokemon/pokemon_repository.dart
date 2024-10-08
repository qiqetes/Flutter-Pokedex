import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokedex_flutter/features/pokemon/models/poke_type.dart';
import 'package:pokedex_flutter/features/pokemon/models/pokemon.dart';
import 'package:collection/collection.dart';

class PokemonRepository {
  final GraphQLClient _client;

  PokemonRepository(this._client);

  Future<List<Pokemon>> fetchPokemons({
    int limit = 10,
    int offset = 0,
    String? name,
    List<PokeType>? types,
  }) async {
    // FIXME: queryInjections, use variables instead
    final String nameFilter =
        name != null && name.isNotEmpty ? ', name: {_ilike: "$name%"}' : '';
    final String typesFilter = types != null && types.isNotEmpty
        ? ', pokemon_v2_pokemontypes: {type_id: {_in: ${types.map((t) => t.typeId).join(',')}}}'
        : '';
    final String whereFilter =
        ', where: {is_default: {_eq: true}, pokemon_v2_pokemonsprites: {sprites: {_has_key: "front_default"}}$nameFilter$typesFilter}';

    final String query = '''
      query fetchPokemons() {
        pokemon_v2_pokemon(limit: $limit, offset: $offset$whereFilter) {
          name
          pokemon_v2_pokemontypes {
            pokemon_v2_type {
              name
            }
          }
          pokemon_v2_pokemonsprites(where: {sprites: {_has_key: "front_default"}}, limit: 1) {
            sprites(path: "front_default")
          }
          id
          height
        }
      }
    ''';

    final QueryOptions options = QueryOptions(document: gql(query));

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List<dynamic> data = result.data!['pokemon_v2_pokemon'];
    return data
        .map((json) {
          try {
            return Pokemon.fromResource(json);
          } catch (e) {
            //
          }
        })
        .whereNotNull()
        .toList();
  }
}

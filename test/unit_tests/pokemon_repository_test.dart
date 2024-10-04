import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokedex_flutter/features/pokemon/pokemon_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PokemonRepository', () {
    late PokemonRepository repository;
    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink('https://beta.pokeapi.co/graphql/v1beta'),
    );

    setUp(() {
      repository = PokemonRepository(client);
    });

    test('fetchPokemons not null, made it to see if it works', () async {
      final pokemons = await repository.fetchPokemons(name: 'bulbasaur');
      print(pokemons);
      expect(pokemons, isNotNull);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_flutter/features/pokemon/models/poke_type.dart';
import 'package:pokedex_flutter/features/pokemon/models/pokemon.dart';

/// Tests the mapping logic that PokemonRepository relies on to convert raw
/// API JSON into domain Pokemon objects. This exercises the same code path
/// without requiring a live or mocked GraphQL transport.
void main() {
  group('PokemonRepository – fromResource mapping', () {
    final Map<String, dynamic> singlePokemonJson = {
      'name': 'bulbasaur',
      'id': 1,
      'height': 7,
      'pokemon_v2_pokemontypes': [
        {
          'pokemon_v2_type': {'name': 'grass'}
        },
        {
          'pokemon_v2_type': {'name': 'poison'}
        }
      ],
      'pokemon_v2_pokemonsprites': [
        {
          'sprites':
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png'
        }
      ],
    };

    test('maps name, id, height and spriteUrl correctly', () {
      final pokemon = Pokemon.fromResource(singlePokemonJson);

      expect(pokemon.name, 'bulbasaur');
      expect(pokemon.id, 1);
      expect(pokemon.height, 7);
      expect(
        pokemon.spriteUrl,
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
      );
    });

    test('maps two types correctly', () {
      final pokemon = Pokemon.fromResource(singlePokemonJson);

      expect(pokemon.types, hasLength(2));
      expect(pokemon.types[0], PokeType.grass);
      expect(pokemon.types[1], PokeType.poison);
    });

    test('hasTwoTypes returns true when two types are present', () {
      final pokemon = Pokemon.fromResource(singlePokemonJson);
      expect(pokemon.hasTwoTypes, isTrue);
    });

    test('hasTwoTypes returns false for single-type pokemon', () {
      final json = Map<String, dynamic>.from(singlePokemonJson)
        ..['pokemon_v2_pokemontypes'] = [
          {
            'pokemon_v2_type': {'name': 'fire'}
          }
        ];
      final pokemon = Pokemon.fromResource(json);
      expect(pokemon.hasTwoTypes, isFalse);
    });

    test('unknown type falls back to normal', () {
      final json = Map<String, dynamic>.from(singlePokemonJson)
        ..['pokemon_v2_pokemontypes'] = [
          {
            'pokemon_v2_type': {'name': 'unknowntype'}
          }
        ];
      final pokemon = Pokemon.fromResource(json);
      expect(pokemon.types[0], PokeType.normal);
    });
  });
}

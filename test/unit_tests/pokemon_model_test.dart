import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_flutter/features/pokemon/models/pokemon.dart';

void main() {
  group('Pokemon', () {
    test('fromJson', () {
      final Map<String, dynamic> json = {
        "name": "bulbasaur",
        "id": 1,
        "pokemon_v2_pokemontypes": [
          {
            "pokemon_v2_type": {"name": "grass"}
          },
          {
            "pokemon_v2_type": {"name": "poison"}
          }
        ],
        "pokemon_v2_pokemonsprites": [
          {
            "sprites":
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"
          }
        ]
      };

      final pokemon = Pokemon.fromResource(json);

      expect(pokemon.id, 1);
      expect(pokemon.name, "bulbasaur");
      expect(pokemon.types.length, 2);
      expect(pokemon.types[0].name, "grass");
      expect(pokemon.types[1].name, "poison");
      expect(pokemon.spriteUrl,
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png");
    });
  });
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter/features/pokemon/models/poke_type.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon(
      {required int id,
      required String name,
      required List<PokeType> types,
      required String spriteUrl,
      required int height,
      required}) = _Pokemon;

  factory Pokemon.fromJson(Map<String, Object?> json) =>
      _$PokemonFromJson(json);

  factory Pokemon.fromResource(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] as int,
      name: json['name'] as String,
      types: (json['pokemon_v2_pokemontypes'] as List)
          .map((type) => PokeType.fromResource(type))
          .toList(),
      height: json['height'] as int,
      spriteUrl: (json['pokemon_v2_pokemonsprites'] as List).first['sprites'],
    );
  }
}

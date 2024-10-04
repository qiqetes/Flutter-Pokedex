// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonImpl _$$PokemonImplFromJson(Map<String, dynamic> json) =>
    _$PokemonImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      types: (json['types'] as List<dynamic>)
          .map((e) => $enumDecode(_$PokeTypeEnumMap, e))
          .toList(),
      spriteUrl: json['spriteUrl'] as String,
      required: json['required'],
    );

Map<String, dynamic> _$$PokemonImplToJson(_$PokemonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'types': instance.types.map((e) => _$PokeTypeEnumMap[e]!).toList(),
      'spriteUrl': instance.spriteUrl,
      'required': instance.required,
    };

const _$PokeTypeEnumMap = {
  PokeType.water: 'water',
  PokeType.steel: 'steel',
  PokeType.rock: 'rock',
  PokeType.psychic: 'psychic',
  PokeType.poison: 'poison',
  PokeType.normal: 'normal',
  PokeType.ice: 'ice',
  PokeType.ground: 'ground',
  PokeType.grass: 'grass',
  PokeType.ghost: 'ghost',
  PokeType.fire: 'fire',
  PokeType.fighting: 'fighting',
  PokeType.fairy: 'fairy',
  PokeType.electric: 'electric',
  PokeType.dragon: 'dragon',
  PokeType.dark: 'dark',
  PokeType.bug: 'bug',
  PokeType.flying: 'flying',
};

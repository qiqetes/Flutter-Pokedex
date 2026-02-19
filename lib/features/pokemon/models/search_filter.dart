import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter/features/pokemon/models/poke_type.dart';

part 'search_filter.freezed.dart';

@freezed
abstract class SearchFilter with _$SearchFilter {
  const factory SearchFilter({String? name, PokeType? type}) = _SearchFilter;
}

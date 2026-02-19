import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter/features/pokemon/models/poke_type.dart';
import 'package:pokedex_flutter/features/pokemon/providers/captured_provider.dart';
import 'package:pokedex_flutter/ui/k_colors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokedex_palette_provider.freezed.dart';
part 'pokedex_palette_provider.g.dart';

@freezed
abstract class PokedexPalette with _$PokedexPalette {
  const factory PokedexPalette({
    required Color primary,
    required Color secondary,
  }) = _PokedexPalette;

  factory PokedexPalette.fromType(PokeType type) =>
      PokedexPalette(primary: type.color, secondary: type.secondaryColor);

  factory PokedexPalette.neutral() => const PokedexPalette(
    primary: kColPokedexRed,
    secondary: kColPokedexRedSecondary,
  );
}

@riverpod
PokedexPalette pokedexPalette(Ref ref) {
  final type = ref.watch(predominantTypeProvider);
  if (type == null) {
    return PokedexPalette.neutral();
  }

  return PokedexPalette.fromType(type);
}

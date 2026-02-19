// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex_palette_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pokedexPalette)
final pokedexPaletteProvider = PokedexPaletteProvider._();

final class PokedexPaletteProvider
    extends $FunctionalProvider<PokedexPalette, PokedexPalette, PokedexPalette>
    with $Provider<PokedexPalette> {
  PokedexPaletteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pokedexPaletteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pokedexPaletteHash();

  @$internal
  @override
  $ProviderElement<PokedexPalette> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PokedexPalette create(Ref ref) {
    return pokedexPalette(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PokedexPalette value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PokedexPalette>(value),
    );
  }
}

String _$pokedexPaletteHash() => r'4a7be8f894637d3c5404e78e92ffab39fe1fcbb2';

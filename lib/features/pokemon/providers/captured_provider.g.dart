// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'captured_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$predominantTypeHash() => r'67c32d697d11c198ae7d70f1d426d6ea87276887';

/// See also [predominantType].
@ProviderFor(predominantType)
final predominantTypeProvider = AutoDisposeProvider<PokeType>.internal(
  predominantType,
  name: r'predominantTypeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$predominantTypeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PredominantTypeRef = AutoDisposeProviderRef<PokeType>;
String _$capturedPokemonHash() => r'3c2a4f078053af902e3b284c69dcc970f4d1a041';

/// See also [CapturedPokemon].
@ProviderFor(CapturedPokemon)
final capturedPokemonProvider =
    AutoDisposeNotifierProvider<CapturedPokemon, List<Pokemon>>.internal(
  CapturedPokemon.new,
  name: r'capturedPokemonProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$capturedPokemonHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CapturedPokemon = AutoDisposeNotifier<List<Pokemon>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_pokemon_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(currentPokemon)
final currentPokemonProvider = CurrentPokemonProvider._();

final class CurrentPokemonProvider
    extends $FunctionalProvider<Pokemon, Pokemon, Pokemon>
    with $Provider<Pokemon> {
  CurrentPokemonProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentPokemonProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentPokemonHash();

  @$internal
  @override
  $ProviderElement<Pokemon> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Pokemon create(Ref ref) {
    return currentPokemon(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Pokemon value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Pokemon>(value),
    );
  }
}

String _$currentPokemonHash() => r'1c0fb44b75337229d0c1e2ab12d8a3db2e447ff9';

@ProviderFor(pokemonById)
final pokemonByIdProvider = PokemonByIdFamily._();

final class PokemonByIdProvider
    extends $FunctionalProvider<Pokemon, Pokemon, Pokemon>
    with $Provider<Pokemon> {
  PokemonByIdProvider._({
    required PokemonByIdFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'pokemonByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pokemonByIdHash();

  @override
  String toString() {
    return r'pokemonByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Pokemon> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Pokemon create(Ref ref) {
    final argument = this.argument as int;
    return pokemonById(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Pokemon value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Pokemon>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PokemonByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pokemonByIdHash() => r'0ce7a17ec83b1f11d037566ab9e6fca555823667';

final class PokemonByIdFamily extends $Family
    with $FunctionalFamilyOverride<Pokemon, int> {
  PokemonByIdFamily._()
    : super(
        retry: null,
        name: r'pokemonByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PokemonByIdProvider call(int pokemonId) =>
      PokemonByIdProvider._(argument: pokemonId, from: this);

  @override
  String toString() => r'pokemonByIdProvider';
}

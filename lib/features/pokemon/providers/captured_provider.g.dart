// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'captured_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CapturedPokemon)
final capturedPokemonProvider = CapturedPokemonProvider._();

final class CapturedPokemonProvider
    extends $NotifierProvider<CapturedPokemon, List<Pokemon>> {
  CapturedPokemonProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'capturedPokemonProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$capturedPokemonHash();

  @$internal
  @override
  CapturedPokemon create() => CapturedPokemon();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Pokemon> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Pokemon>>(value),
    );
  }
}

String _$capturedPokemonHash() => r'82390487c36a9d1d89ceea93c61218658a709eea';

abstract class _$CapturedPokemon extends $Notifier<List<Pokemon>> {
  List<Pokemon> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Pokemon>, List<Pokemon>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Pokemon>, List<Pokemon>>,
              List<Pokemon>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Returns null if no captured or no predominant type

@ProviderFor(predominantType)
final predominantTypeProvider = PredominantTypeProvider._();

/// Returns null if no captured or no predominant type

final class PredominantTypeProvider
    extends $FunctionalProvider<PokeType?, PokeType?, PokeType?>
    with $Provider<PokeType?> {
  /// Returns null if no captured or no predominant type
  PredominantTypeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'predominantTypeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$predominantTypeHash();

  @$internal
  @override
  $ProviderElement<PokeType?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PokeType? create(Ref ref) {
    return predominantType(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PokeType? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PokeType?>(value),
    );
  }
}

String _$predominantTypeHash() => r'1ef64b279f7db4491df9f48aa2c5c4150f095b54';

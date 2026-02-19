// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pokemonRepository)
final pokemonRepositoryProvider = PokemonRepositoryProvider._();

final class PokemonRepositoryProvider
    extends
        $FunctionalProvider<
          PokemonRepository,
          PokemonRepository,
          PokemonRepository
        >
    with $Provider<PokemonRepository> {
  PokemonRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pokemonRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pokemonRepositoryHash();

  @$internal
  @override
  $ProviderElement<PokemonRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PokemonRepository create(Ref ref) {
    return pokemonRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PokemonRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PokemonRepository>(value),
    );
  }
}

String _$pokemonRepositoryHash() => r'c064154d8877cfde335af317be86cc6f4e6214b1';

@ProviderFor(PokemonController)
final pokemonControllerProvider = PokemonControllerFamily._();

final class PokemonControllerProvider
    extends $AsyncNotifierProvider<PokemonController, List<Pokemon>> {
  PokemonControllerProvider._({
    required PokemonControllerFamily super.from,
    required ({PokeType? type, String? searchName}) super.argument,
  }) : super(
         retry: null,
         name: r'pokemonControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pokemonControllerHash();

  @override
  String toString() {
    return r'pokemonControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  PokemonController create() => PokemonController();

  @override
  bool operator ==(Object other) {
    return other is PokemonControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pokemonControllerHash() => r'f2767ed1b9ba63c1bac60218d80d99ced0bfbbfa';

final class PokemonControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          PokemonController,
          AsyncValue<List<Pokemon>>,
          List<Pokemon>,
          FutureOr<List<Pokemon>>,
          ({PokeType? type, String? searchName})
        > {
  PokemonControllerFamily._()
    : super(
        retry: null,
        name: r'pokemonControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PokemonControllerProvider call({PokeType? type, String? searchName}) =>
      PokemonControllerProvider._(
        argument: (type: type, searchName: searchName),
        from: this,
      );

  @override
  String toString() => r'pokemonControllerProvider';
}

abstract class _$PokemonController extends $AsyncNotifier<List<Pokemon>> {
  late final _$args = ref.$arg as ({PokeType? type, String? searchName});
  PokeType? get type => _$args.type;
  String? get searchName => _$args.searchName;

  FutureOr<List<Pokemon>> build({PokeType? type, String? searchName});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Pokemon>>, List<Pokemon>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Pokemon>>, List<Pokemon>>,
              AsyncValue<List<Pokemon>>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(type: _$args.type, searchName: _$args.searchName),
    );
  }
}

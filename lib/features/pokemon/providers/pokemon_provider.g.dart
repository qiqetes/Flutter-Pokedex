// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonControllerHash() => r'b7ec94a43a151c590ebe5abe1a41f7268f942fc1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$PokemonController
    extends BuildlessAutoDisposeAsyncNotifier<List<Pokemon>> {
  late final PokeType? type;
  late final String? searchName;

  FutureOr<List<Pokemon>> build({
    PokeType? type,
    String? searchName,
  });
}

/// See also [PokemonController].
@ProviderFor(PokemonController)
const pokemonControllerProvider = PokemonControllerFamily();

/// See also [PokemonController].
class PokemonControllerFamily extends Family<AsyncValue<List<Pokemon>>> {
  /// See also [PokemonController].
  const PokemonControllerFamily();

  /// See also [PokemonController].
  PokemonControllerProvider call({
    PokeType? type,
    String? searchName,
  }) {
    return PokemonControllerProvider(
      type: type,
      searchName: searchName,
    );
  }

  @override
  PokemonControllerProvider getProviderOverride(
    covariant PokemonControllerProvider provider,
  ) {
    return call(
      type: provider.type,
      searchName: provider.searchName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pokemonControllerProvider';
}

/// See also [PokemonController].
class PokemonControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    PokemonController, List<Pokemon>> {
  /// See also [PokemonController].
  PokemonControllerProvider({
    PokeType? type,
    String? searchName,
  }) : this._internal(
          () => PokemonController()
            ..type = type
            ..searchName = searchName,
          from: pokemonControllerProvider,
          name: r'pokemonControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pokemonControllerHash,
          dependencies: PokemonControllerFamily._dependencies,
          allTransitiveDependencies:
              PokemonControllerFamily._allTransitiveDependencies,
          type: type,
          searchName: searchName,
        );

  PokemonControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
    required this.searchName,
  }) : super.internal();

  final PokeType? type;
  final String? searchName;

  @override
  FutureOr<List<Pokemon>> runNotifierBuild(
    covariant PokemonController notifier,
  ) {
    return notifier.build(
      type: type,
      searchName: searchName,
    );
  }

  @override
  Override overrideWith(PokemonController Function() create) {
    return ProviderOverride(
      origin: this,
      override: PokemonControllerProvider._internal(
        () => create()
          ..type = type
          ..searchName = searchName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
        searchName: searchName,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PokemonController, List<Pokemon>>
      createElement() {
    return _PokemonControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PokemonControllerProvider &&
        other.type == type &&
        other.searchName == searchName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, searchName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PokemonControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Pokemon>> {
  /// The parameter `type` of this provider.
  PokeType? get type;

  /// The parameter `searchName` of this provider.
  String? get searchName;
}

class _PokemonControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PokemonController,
        List<Pokemon>> with PokemonControllerRef {
  _PokemonControllerProviderElement(super.provider);

  @override
  PokeType? get type => (origin as PokemonControllerProvider).type;
  @override
  String? get searchName => (origin as PokemonControllerProvider).searchName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

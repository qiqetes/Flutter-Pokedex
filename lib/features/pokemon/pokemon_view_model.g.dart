// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PokemonDetailViewModel)
final pokemonDetailViewModelProvider = PokemonDetailViewModelProvider._();

final class PokemonDetailViewModelProvider
    extends $NotifierProvider<PokemonDetailViewModel, PokemonDetailState> {
  PokemonDetailViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pokemonDetailViewModelProvider',
        isAutoDispose: true,
        dependencies: <ProviderOrFamily>[currentPokemonProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          PokemonDetailViewModelProvider.$allTransitiveDependencies0,
        ],
      );

  static final $allTransitiveDependencies0 = currentPokemonProvider;

  @override
  String debugGetCreateSourceHash() => _$pokemonDetailViewModelHash();

  @$internal
  @override
  PokemonDetailViewModel create() => PokemonDetailViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PokemonDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PokemonDetailState>(value),
    );
  }
}

String _$pokemonDetailViewModelHash() =>
    r'd23a58668b56cc04d319390ab490332b12313fe1';

abstract class _$PokemonDetailViewModel extends $Notifier<PokemonDetailState> {
  PokemonDetailState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PokemonDetailState, PokemonDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PokemonDetailState, PokemonDetailState>,
              PokemonDetailState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

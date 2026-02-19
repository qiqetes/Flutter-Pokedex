// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_filter_cache_notifier_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchFilterCacheNotifier)
final searchFilterCacheProvider = SearchFilterCacheNotifierProvider._();

final class SearchFilterCacheNotifierProvider
    extends $NotifierProvider<SearchFilterCacheNotifier, List<SearchFilter>> {
  SearchFilterCacheNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchFilterCacheProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchFilterCacheNotifierHash();

  @$internal
  @override
  SearchFilterCacheNotifier create() => SearchFilterCacheNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SearchFilter> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SearchFilter>>(value),
    );
  }
}

String _$searchFilterCacheNotifierHash() =>
    r'6b85779748c62fc556066ca4c7cbc965535d3659';

abstract class _$SearchFilterCacheNotifier
    extends $Notifier<List<SearchFilter>> {
  List<SearchFilter> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<SearchFilter>, List<SearchFilter>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<SearchFilter>, List<SearchFilter>>,
              List<SearchFilter>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

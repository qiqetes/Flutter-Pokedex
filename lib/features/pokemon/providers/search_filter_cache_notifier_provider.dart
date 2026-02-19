import 'package:pokedex_flutter/features/pokemon/models/search_filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'search_filter_cache_notifier_provider.g.dart';

@Riverpod(keepAlive: true)
class SearchFilterCacheNotifier extends _$SearchFilterCacheNotifier {
  @override
  List<SearchFilter> build() {
    return [];
  }

  void addFilter(SearchFilter filter) {
    state = [...state, filter];
  }

  void removeFilter(SearchFilter filter) {
    state = state.where((f) => f != filter).toList();
  }
}

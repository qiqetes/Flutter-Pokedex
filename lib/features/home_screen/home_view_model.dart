import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  String build() => '';

  void updateSearch(String text) => state = text;

  void clearSearch() => state = '';
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TypeViewModel)
final typeViewModelProvider = TypeViewModelFamily._();

final class TypeViewModelProvider
    extends $NotifierProvider<TypeViewModel, AsyncValue<List<Pokemon>>> {
  TypeViewModelProvider._({
    required TypeViewModelFamily super.from,
    required PokeType super.argument,
  }) : super(
         retry: null,
         name: r'typeViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$typeViewModelHash();

  @override
  String toString() {
    return r'typeViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TypeViewModel create() => TypeViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<Pokemon>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<Pokemon>>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TypeViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$typeViewModelHash() => r'adb9b0d4490f11adb4a978df4d293930184d3dfd';

final class TypeViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          TypeViewModel,
          AsyncValue<List<Pokemon>>,
          AsyncValue<List<Pokemon>>,
          AsyncValue<List<Pokemon>>,
          PokeType
        > {
  TypeViewModelFamily._()
    : super(
        retry: null,
        name: r'typeViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TypeViewModelProvider call(PokeType type) =>
      TypeViewModelProvider._(argument: type, from: this);

  @override
  String toString() => r'typeViewModelProvider';
}

abstract class _$TypeViewModel extends $Notifier<AsyncValue<List<Pokemon>>> {
  late final _$args = ref.$arg as PokeType;
  PokeType get type => _$args;

  AsyncValue<List<Pokemon>> build(PokeType type);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<Pokemon>>, AsyncValue<List<Pokemon>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Pokemon>>, AsyncValue<List<Pokemon>>>,
              AsyncValue<List<Pokemon>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

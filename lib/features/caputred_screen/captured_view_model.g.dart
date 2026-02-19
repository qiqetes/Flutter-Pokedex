// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'captured_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(capturedViewModel)
final capturedViewModelProvider = CapturedViewModelProvider._();

final class CapturedViewModelProvider
    extends
        $FunctionalProvider<
          CapturedViewState,
          CapturedViewState,
          CapturedViewState
        >
    with $Provider<CapturedViewState> {
  CapturedViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'capturedViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$capturedViewModelHash();

  @$internal
  @override
  $ProviderElement<CapturedViewState> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CapturedViewState create(Ref ref) {
    return capturedViewModel(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CapturedViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CapturedViewState>(value),
    );
  }
}

String _$capturedViewModelHash() => r'565e6a0a7d6c1628a101b3fe1ae11e7ccc6b820e';

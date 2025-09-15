// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_api_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appApi)
const appApiProvider = AppApiProvider._();

final class AppApiProvider extends $FunctionalProvider<AppApi, AppApi, AppApi>
    with $Provider<AppApi> {
  const AppApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appApiHash();

  @$internal
  @override
  $ProviderElement<AppApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppApi create(Ref ref) {
    return appApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppApi>(value),
    );
  }
}

String _$appApiHash() => r'0d18e9607f317a0ee0d85ddaffe895a4b9696579';

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appRepository)
const appRepositoryProvider = AppRepositoryProvider._();

final class AppRepositoryProvider
    extends $FunctionalProvider<AppRepository, AppRepository, AppRepository>
    with $Provider<AppRepository> {
  const AppRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appRepositoryHash();

  @$internal
  @override
  $ProviderElement<AppRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppRepository create(Ref ref) {
    return appRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppRepository>(value),
    );
  }
}

String _$appRepositoryHash() => r'10466ad7865fac0aa38653bc9d216fe953edd937';

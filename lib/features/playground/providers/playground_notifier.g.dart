// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playground_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(PlaygroundNotifier)
const playgroundNotifierProvider = PlaygroundNotifierProvider._();

final class PlaygroundNotifierProvider
    extends $AsyncNotifierProvider<PlaygroundNotifier, Option<bool>> {
  const PlaygroundNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playgroundNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playgroundNotifierHash();

  @$internal
  @override
  PlaygroundNotifier create() => PlaygroundNotifier();
}

String _$playgroundNotifierHash() =>
    r'5cbed15176328daa44cf9b0dc173896529166923';

abstract class _$PlaygroundNotifier extends $AsyncNotifier<Option<bool>> {
  FutureOr<Option<bool>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<Option<bool>>, Option<bool>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Option<bool>>, Option<bool>>,
              AsyncValue<Option<bool>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

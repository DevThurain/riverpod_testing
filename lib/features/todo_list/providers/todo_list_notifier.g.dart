// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(TodoListNotifier)
@JsonPersist()
const todoListNotifierProvider = TodoListNotifierProvider._();

final class TodoListNotifierProvider
    extends $AsyncNotifierProvider<TodoListNotifier, List<TodoEntity>> {
  const TodoListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todoListNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todoListNotifierHash();

  @$internal
  @override
  TodoListNotifier create() => TodoListNotifier();
}

String _$todoListNotifierHash() => r'92f02176c03e15a528c94b975cbb50d2080b25eb';

abstract class _$TodoListNotifierBase extends $AsyncNotifier<List<TodoEntity>> {
  FutureOr<List<TodoEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<TodoEntity>>, List<TodoEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<TodoEntity>>, List<TodoEntity>>,
              AsyncValue<List<TodoEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

// **************************************************************************
// JsonGenerator
// **************************************************************************

abstract class _$TodoListNotifier extends _$TodoListNotifierBase {
  /// The default key used by [persist].
  String get key {
    const resolvedKey = "TodoListNotifier";
    return resolvedKey;
  }

  /// A variant of [persist], for JSON-specific encoding.
  ///
  /// You can override [key] to customize the key used for storage.
  FutureOr<void> persist(
    FutureOr<Storage<String, String>> storage, {
    String Function(List<TodoEntity> state)? encode,
    List<TodoEntity> Function(String encoded)? decode,
    StorageOptions options = const StorageOptions(),
  }) {
    return NotifierPersistX(this).persist<String, String>(
      storage,
      key: key,
      encode: encode ?? $jsonCodex.encode,
      decode:
          decode ??
          (encoded) {
            final e = $jsonCodex.decode(encoded);
            return (e as List)
                .map((e) => TodoEntity.fromJson(e as Map<String, Object?>))
                .toList();
          },
      options: options,
    );
  }
}

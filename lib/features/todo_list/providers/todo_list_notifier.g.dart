// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TodoListNotifier)
@JsonPersist()
const todoListProvider = TodoListNotifierProvider._();

@JsonPersist()
final class TodoListNotifierProvider
    extends $AsyncNotifierProvider<TodoListNotifier, List<TodoEntity>> {
  const TodoListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todoListProvider',
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

String _$todoListNotifierHash() => r'57965d5c0dc56b4939a9a133e405ef8b6395a031';

@JsonPersist()
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

// **************************************************************************
// JsonGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
abstract class _$TodoListNotifier extends _$TodoListNotifierBase {
  /// The default key used by [persist].
  String get key {
    const resolvedKey = "TodoListNotifier";
    return resolvedKey;
  }

  /// A variant of [persist], for JSON-specific encoding.
  ///
  /// You can override [key] to customize the key used for storage.
  PersistResult persist(
    FutureOr<Storage<String, String>> storage, {
    String? key,
    String Function(List<TodoEntity> state)? encode,
    List<TodoEntity> Function(String encoded)? decode,
    StorageOptions options = const StorageOptions(),
  }) {
    return NotifierPersistX(this).persist<String, String>(
      storage,
      key: key ?? this.key,
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

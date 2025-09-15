import 'package:hooks_riverpod/experimental/mutation.dart';
import 'package:riverpod_annotation/experimental/json_persist.dart';
import 'package:riverpod_annotation/experimental/persist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_testing/domain/entities/todo_entity.dart';
import 'package:riverpod_testing/features/todo_list/providers/storage_provider.dart';

part 'todo_list_notifier.g.dart';

@riverpod
@JsonPersist()
class TodoListNotifier extends _$TodoListNotifier {
  @override
  Future<List<TodoEntity>> build() async {
    persist(ref.watch(storageProvider.future));
    return [];
  }
  

  Future<void> addTodo(TodoEntity todo) async {
    state = AsyncLoading();
    await Future.delayed(Duration(seconds: 2));

    final currentTodos = state.value ?? [];
    state = AsyncData([...currentTodos, todo]);
  }

  Future<void> removeTodo(String id) async {
    state = AsyncLoading();
    await Future.delayed(Duration(seconds: 2));

    final currentTodos = state.value ?? [];
    final updatedTodos = currentTodos.where((todo) => todo.id != id).toList();
    state = AsyncData(updatedTodos);
  }
}

final fetchTodoMutation = Mutation<void>();
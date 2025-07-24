import 'package:flutter/material.dart';
import 'package:hooks_riverpod/experimental/mutation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_testing/data/entities/todo_entity.dart';
import 'package:riverpod_testing/features/todo_list/providers/todo_list_notifier.dart';
import 'package:uuid/v4.dart';

class TodoListScreen extends HookConsumerWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoListAsync = ref.watch(todoListNotifierProvider);
    final addTodo = ref.watch(addTodoMutation);
    final removeTodo = ref.watch(removeTodoMutation);

    return Scaffold(
      floatingActionButton: SizedBox(
        child: switch (removeTodo) {
          MutationIdle<void>() => AddTodoButton(),
          MutationPending<void>() => SizedBox(),
          MutationError<void>() => AddTodoButton(),
          MutationSuccess<void>() => AddTodoButton(),
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            todoListAsync.when(
              loading: () => Expanded(child: Center(child: CircularProgressIndicator())),
              error: (error, stackTrace) => SizedBox(),
              data: (todoList) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: todoList.length,
                    itemBuilder:
                        (context, index) => ListTile(
                          title: Text('Title $index'),
                          subtitle: Text(todoList[index].description),
                          onTap: () {
                            removeTodoMutation.run(ref, (ref) async {
                              await ref.get(todoListNotifierProvider.notifier).removeTodo(todoList[index].id);
                            });
                          },
                        ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AddTodoButton extends ConsumerWidget {
  const AddTodoButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        addTodoMutation.run(ref, (ref) async {
          final uuid = UuidV4().generate();
          ref.get(todoListNotifierProvider.notifier).addTodo(TodoEntity(id: uuid, description: uuid, completed: false));
        });
      },
    );
  }
}

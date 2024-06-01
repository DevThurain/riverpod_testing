import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Counter extends StateNotifier<int?> {
  Counter() : super(null);
  void increment() => state = (state ?? 0) + 1;
}

var counterProvider = StateNotifierProvider<Counter, int?>((ref) => Counter());

class CounterPage extends ConsumerWidget {
  static const routeName = 'counter_page';
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child) {
            var count = ref.watch(counterProvider);
            var text = count == null ? "Counter" : count.toString();
            return Text(text);
          },
        ),
      ),
      body: Center(
        child: TextButton(
          child: const Text('Increment'),
          onPressed: () {
            ref.read(counterProvider.notifier).increment();
          },
        ),
      ),
    );
  }
}

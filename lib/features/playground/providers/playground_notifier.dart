import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'playground_notifier.g.dart';

@riverpod
class PlaygroundNotifier extends _$PlaygroundNotifier {
  @override
  Future<Option<bool>> build() async {
    return none();
  }

  Future<void> fetchData() async {
    state = AsyncLoading();

    await Future.delayed(Duration(seconds: 1));
    state = AsyncData(some(true));
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_entity.freezed.dart';
part 'todo_entity.g.dart';

@Freezed()
abstract class TodoEntity with _$TodoEntity {
  factory TodoEntity({required String id, required String description, required bool completed}) = _TodoEntity;

  factory TodoEntity.fromJson(Map<String, dynamic> json) => _$TodoEntityFromJson(json);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodoEntity _$TodoEntityFromJson(Map<String, dynamic> json) => _TodoEntity(
  id: json['id'] as String,
  description: json['description'] as String,
  completed: json['completed'] as bool,
);

Map<String, dynamic> _$TodoEntityToJson(_TodoEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'completed': instance.completed,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Failure<T> _$FailureFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _Failure<T>(
  code: (json['code'] as num?)?.toInt() ?? 0,
  msg: json['msg'] as String? ?? "",
  exceptionType:
      $enumDecodeNullable(_$ExceptionTypeEnumMap, json['exceptionType']) ??
      ExceptionType.none,
  content: _$nullableGenericFromJson(json['content'], fromJsonT),
  object: json['object'],
);

Map<String, dynamic> _$FailureToJson<T>(
  _Failure<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'code': instance.code,
  'msg': instance.msg,
  'exceptionType': _$ExceptionTypeEnumMap[instance.exceptionType]!,
  'content': _$nullableGenericToJson(instance.content, toJsonT),
  'object': instance.object,
};

const _$ExceptionTypeEnumMap = {
  ExceptionType.none: 'none',
  ExceptionType.noInternet: 'noInternet',
  ExceptionType.authExpired: 'authExpired',
  ExceptionType.serverError: 'serverError',
  ExceptionType.nullResponse: 'nullResponse',
  ExceptionType.unknownException: 'unknownException',
  ExceptionType.general: 'general',
  ExceptionType.dioApiCancel: 'dioApiCancel',
  ExceptionType.dioTimeOut: 'dioTimeOut',
  ExceptionType.dioBadCertificate: 'dioBadCertificate',
  ExceptionType.httpServiceUnavailable: 'httpServiceUnavailable',
  ExceptionType.httpApiNotFound: 'httpApiNotFound',
  ExceptionType.httpOthers: 'httpOthers',
  ExceptionType.custom: 'custom',
  ExceptionType.biometric: 'biometric',
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);

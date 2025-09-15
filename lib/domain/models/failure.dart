import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

part 'failure.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class Failure<T> with _$Failure<T> {
  const factory Failure({
    @Default(0) int? code,
    @Default("") String? msg,
    @Default(ExceptionType.none) ExceptionType exceptionType,
    T? content,
    Object? object,
  }) = _Failure<T>;

  factory Failure.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$FailureFromJson(json, fromJsonT);
}

enum ExceptionType {
  none,
  noInternet,
  authExpired,
  serverError,
  nullResponse,
  unknownException,
  general,
  dioApiCancel,
  dioTimeOut,
  dioBadCertificate,
  httpServiceUnavailable,
  httpApiNotFound,
  httpOthers,
  custom,
  biometric,
}

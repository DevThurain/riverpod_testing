import 'package:flutter/animation.dart';
import 'package:riverpod_testing/domain/models/failure.dart';

extension ObjectExtension on Object {
  Failure? extractException(ExceptionType exceptionType) {
    if (this is Failure) {
      final failure = this as Failure;
      if (failure.exceptionType == exceptionType) return failure;
    }
    return null;
  }

  Failure? mapFailure() {
    if (this is Failure) {
      final failure = this as Failure;
      return failure;
    }
    return null;
  }

  void ifException(ExceptionType exceptionType, {required VoidCallback then}) {
    if (this is Failure) {
      final failure = this as Failure;
      if (failure.exceptionType == exceptionType) {
        then();
      }
    }
  }

  void ifExceptionWithFailure(ExceptionType exceptionType, {required Function(Failure) then}) {
    if (this is Failure) {
      final failure = this as Failure;
      if (failure.exceptionType == exceptionType) {
        then(failure);
      }
    }
  }
}

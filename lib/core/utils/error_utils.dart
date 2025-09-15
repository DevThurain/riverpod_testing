import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_testing/core/logger/logs.dart';
import 'package:riverpod_testing/domain/models/failure.dart';
import 'package:riverpod_testing/features/global/dialogs/dialogs.dart';
import 'package:toastification/toastification.dart';

class ErrorUtils {
  static Failure handleDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        return Failure(exceptionType: ExceptionType.dioApiCancel);

      case DioExceptionType.connectionTimeout:
        return Failure(exceptionType: ExceptionType.dioTimeOut);

      case DioExceptionType.sendTimeout:
        return Failure(exceptionType: ExceptionType.dioTimeOut);

      case DioExceptionType.receiveTimeout:
        return Failure(exceptionType: ExceptionType.dioTimeOut);

      case DioExceptionType.badCertificate:
        return Failure(exceptionType: ExceptionType.dioBadCertificate);

      case DioExceptionType.badResponse:
        return parseDioErrorResponse(dioException);
      case DioExceptionType.connectionError:
        return Failure(exceptionType: ExceptionType.dioTimeOut);

      case DioExceptionType.unknown:
        return Failure(exceptionType: ExceptionType.serverError, msg: 'Unknwn Dio Exception', code: -1);
    }
  }

  static Failure parseDioErrorResponse(DioException dioException) {
    int statusCode = dioException.response?.statusCode ?? -1;
    String? serverMessage;

    try {
      if (statusCode == -1 || statusCode == HttpStatus.ok) {
        statusCode = int.tryParse(dioException.response?.data["statusCode"]) ?? -1;
      }
    } catch (e, s) {
      Logs.apiLogs.finer("failed to parse error message:", s);
      return Failure(exceptionType: ExceptionType.general, object: e);
    }

    switch (statusCode) {
      case 401:
        return buildFailureSafely(
          dioException: dioException,
          exceptionType: ExceptionType.authExpired,
          statusCode: statusCode,
        );
      // case 401:
      case 400:
      case 402:
      case 403:
      case 404:
      case 429:
      case 500:
      case 502:
      case 503:
        return buildFailureSafely(
          dioException: dioException,
          exceptionType: ExceptionType.serverError,
          statusCode: statusCode,
        );

      default:
        return Failure(exceptionType: ExceptionType.serverError, msg: serverMessage, code: statusCode);
    }
  }

  static Failure buildFailureSafely({
    required DioException dioException,
    required ExceptionType exceptionType,
    required int statusCode,
  }) {
    final data = dioException.response?.data;
    if (data is Map<String, dynamic>) {
      try {
        // final baseResponse = BaseResponse<dynamic>.fromJson(data, (json) => json);
        return Failure(exceptionType: exceptionType, code: statusCode, msg: data.toString());
      } catch (e) {
        return Failure(exceptionType: exceptionType, code: -1, msg: 'Failed to parse server error');
      }
    } else {
      return Failure(exceptionType: exceptionType, code: -1, msg: 'Failed to parse server error');
    }
  }

  static void handleFailure({
    required BuildContext context,
    required Object error,
    required StackTrace stackTrace,
    required VoidCallback onRetry,
    required Function(Failure failure)? onCustomError,
  }) {
    if (error is Failure) {
      switch (error.exceptionType) {
        case ExceptionType.custom:
          if (onCustomError != null) {
            onCustomError(error);
          }
          break;
        case ExceptionType.none:
          break;

        case ExceptionType.serverError:
          Dialogs.showErrorDialog(
            title: "Error Code : ${error.code}",
            desc: error.msg ?? 'No Error Message',
            context: context,
            onPressedConfirm: () {},
          );
          break;

        case ExceptionType.noInternet:
          toastification.show(
            context: context,
            style: ToastificationStyle.simple,
            title: Text('No Internet Connection'),
            autoCloseDuration: const Duration(seconds: 3),
            alignment: Alignment.bottomCenter,
          );
          break;

        case ExceptionType.authExpired:
        case ExceptionType.nullResponse:
        case ExceptionType.unknownException:
        case ExceptionType.general:
        case ExceptionType.dioApiCancel:
        case ExceptionType.dioTimeOut:
        case ExceptionType.dioBadCertificate:
        case ExceptionType.httpServiceUnavailable:
        case ExceptionType.httpApiNotFound:
        case ExceptionType.httpOthers:
          Dialogs.showErrorDialog(
            title: "Error Code : ${error.code}",
            desc: error.msg ?? 'Unable to connect with server.',
            context: context,
            onPressedConfirm: () {},
          );

          break;

        case ExceptionType.biometric:
          throw UnimplementedError();
      }
    }
  }
}

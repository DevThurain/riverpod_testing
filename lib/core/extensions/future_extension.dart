import 'package:dio/dio.dart';
import 'package:riverpod_testing/core/logger/logs.dart';
import 'package:riverpod_testing/core/utils/error_utils.dart';
import 'package:riverpod_testing/domain/models/failure.dart';


// Future<BaseResponse<T>> handleApi<T>(Future<BaseResponse<T>> Function() requestFn) async {
//   try {
//     // final haveInternet = true;
//     // // Logs.apiLogs.finer('have internet: $haveInternet');

//     // // if (!haveInternet) {
//     // //   throw Failure(exceptionType: ExceptionType.noInternet);
//     // // }

//     final response = await requestFn();
//     if (response.success) {
//       return response;
//     } else {
//       throw Failure(code: response.error?.code, msg: response.error?.message, exceptionType: ExceptionType.serverError);
//     }
//   } on DioException catch (e) {
//     throw ErrorUtils.handleDioException(e);
//   } catch (e, stack) {
//     Logs.apiLogs.finest('catch error in future extension ${e.toString()}', stack);
//     rethrow;
//   }
// }

Future<T> handleCleanApi<T>(Future<T> Function() requestFn) async {
  try {
    final haveInternet = true;
    Logs.apiLogs.finer('have internet: $haveInternet');

    if (!haveInternet) {
      throw Failure(exceptionType: ExceptionType.noInternet);
    }

    final response = await requestFn();
    return response;
  } on DioException catch (e) {
    throw ErrorUtils.handleDioException(e);
  } catch (e, stack) {
    Logs.apiLogs.finest('catch error in future extension ${e.toString()}', stack);
    rethrow;
  }
}
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_testing/data/network/app_api.dart';

part 'app_api_provider.g.dart';

@Riverpod(keepAlive: true)
AppApi appApi(Ref ref) {
  final dio = Dio();
  // final pref = ref.read(sharedPreferencesFacadeProvider);

  dio.options.baseUrl = 'F.basedUrl';
  dio.options.connectTimeout = const Duration(seconds: 180);
  dio.options.receiveTimeout = const Duration(seconds: 180);

  dio.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true));

  return AppApi(dio);
}

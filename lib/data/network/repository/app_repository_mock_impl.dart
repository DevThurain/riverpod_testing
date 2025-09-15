import 'package:riverpod_testing/data/network/app_api.dart';
import 'package:riverpod_testing/data/network/repository/app_repository.dart';


class AppRepositoryMockImpl extends AppRepository {
  final AppApi appApi;
  AppRepositoryMockImpl({required this.appApi});

  

  // @override
  // Future<BaseResponse<MarkPaymentEntity>> markAsUnpaid({
  //   required MarkPaymentRequest request,
  //   required String paymentId,
  // }) async {
  //   // Add Delay
  //   await Future.delayed(Duration(seconds: 2));

  //   // Load JSON from assets
  //   final jsonString = await rootBundle.loadString(Assets.jsons.onboarding.spinwheelScore.success);
  //   final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

  //   Logs.apiLogs.finer('Mocked MarkAsUnpaid Api Response');
  //   Logs.apiLogs.finer(jsonMap.toString());

  //   // Mock Api
  //   return handleApi(() async {
  //     return BaseResponse.fromJson(jsonMap, (json) => MarkPaymentEntity.fromJson(json as Map<String, dynamic>));
  //   });
  // }
}

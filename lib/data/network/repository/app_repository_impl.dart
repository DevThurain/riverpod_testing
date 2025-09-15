import 'package:riverpod_testing/data/network/app_api.dart';
import 'package:riverpod_testing/data/network/repository/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  final AppApi appApi;
  AppRepositoryImpl({required this.appApi});

  
}

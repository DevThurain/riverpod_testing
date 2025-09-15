import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_testing/data/network/providers/app_api_provider.dart';
import 'package:riverpod_testing/data/network/repository/app_repository.dart';
import 'package:riverpod_testing/data/network/repository/app_repository_impl.dart';

part 'repository_provider.g.dart';

@Riverpod(keepAlive: true)
AppRepository appRepository(Ref ref) {
  final appApi = ref.watch(appApiProvider);

  return AppRepositoryImpl(appApi: appApi);
}
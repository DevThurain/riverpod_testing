import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_sqflite/riverpod_sqflite.dart';

part 'storage_provider.g.dart';

@riverpod
Future<JsonSqFliteStorage> storage(Ref ref) async {
  final dbPath = await _getDatabasesPath();
  return JsonSqFliteStorage.open('$dbPath/riverpod.db');
}

Future<String> _getDatabasesPath() async {
  final dir = await getApplicationCacheDirectory();
  return dir.path;
}

import 'package:logging/logging.dart';
import 'package:riverpod_testing/core/logger/logger.dart';

abstract class Logs {
  static Logger fireLogs =
      Logger('Firebase')
        ..finer(Level.FINER)
        ..onRecord.listen(loggerOnDataCallback());

  static Logger apiLogs =
      Logger('Api')
        ..finer(Level.FINER)
        ..onRecord.listen(loggerOnDataCallback());

  static Logger plaidLogs =
      Logger('Plaid')
        ..finer(Level.FINER)
        ..onRecord.listen(loggerOnDataCallback());

  static Logger stripeLogs =
      Logger('Stripe')
        ..finer(Level.FINER)
        ..onRecord.listen(loggerOnDataCallback());

  static Logger appLogs =
      Logger('App')
        ..finer(Level.FINER)
        ..onRecord.listen(loggerOnDataCallback());
}

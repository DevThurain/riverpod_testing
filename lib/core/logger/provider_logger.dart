import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_testing/core/logger/logger.dart';

const _riverpodEmoji = '';

final class ProviderLogger extends ProviderObserver {
  ProviderLogger() : _logger = Logger('Riverpod') {
    _logger.level = Level.FINER; //Turn off logging for messages whose level is under this level.
    _logger.onRecord.listen(loggerOnDataCallback(prefix: _riverpodEmoji));
  }
  final Logger _logger;

  // This code will be used in next version of Riverpod (3.0.0)
  @override
  void didUpdateProvider(ProviderObserverContext context, Object? previousValue, Object? newValue) {
    if (newValue is AsyncError) return;

    _logger.finest(
      '🔄 DidUpdateProvider: ${context.provider.name}\n'
      '=> oldValue: $previousValue\n'
      '=> newValue: $newValue',
    );
    super.didUpdateProvider(context, previousValue, newValue);
  }

  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    if (value is AsyncError) return;
    final providerName = context.provider.name ?? context.provider.toString();
    _logger.fine(
      'DidAddProvider: $providerName',
      // '=> value: $value',
    );
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    final providerName = context.provider.name ?? context.provider.toString();
    _logger.fine('DidDisposeProvider: $providerName}');
    super.didDisposeProvider(context);
  }
}

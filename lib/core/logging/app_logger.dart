import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

/// Thin wrapper over [Logger] registered in DI so classes depend on an
/// injectable abstraction rather than a global.
@lazySingleton
class AppLogger {
  AppLogger()
    : _logger = Logger(
        printer: PrettyPrinter(
          methodCount: 0,
          errorMethodCount: 6,
          lineLength: 100,
          colors: true,
          printEmojis: true,
        ),
      );

  final Logger _logger;

  void debug(String message) => _logger.d(message);
  void info(String message) => _logger.i(message);
  void warning(String message) => _logger.w(message);
  void error(String message, [Object? error, StackTrace? stackTrace]) =>
      _logger.e(message, error: error, stackTrace: stackTrace);
}

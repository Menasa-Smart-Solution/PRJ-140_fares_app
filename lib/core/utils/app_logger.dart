import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  AppLogger._();

  static final Logger _logger = Logger(
    level: kDebugMode ? Level.debug : Level.off,
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 5,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.dateAndTime,
    ),
  );

  static void log(dynamic message) => _logger.d(message);

  static void info(dynamic message) => _logger.i(message);

  static void warning(dynamic message) => _logger.w(message);

  static void error(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.e(message, error: error, stackTrace: stackTrace);
}

import 'package:injectable/injectable.dart';

/// App / API configuration.
abstract class AppConfig {
  String get baseUrl;
  int get connectTimeoutMs;
  int get receiveTimeoutMs;
  int get sendTimeoutMs;
  bool get enableLogging;
}

@LazySingleton(as: AppConfig)
class DefaultAppConfig implements AppConfig {
  @override
  String get baseUrl => 'https://maygiat.online';

  @override
  int get connectTimeoutMs => 90000;

  @override
  int get receiveTimeoutMs => 90000;

  @override
  int get sendTimeoutMs => 90000;

  @override
  bool get enableLogging => true;
}

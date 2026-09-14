import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quanlymaygiat/core/config/app_config.dart';
import 'package:quanlymaygiat/core/logging/app_logger.dart';
import 'package:quanlymaygiat/core/network/dio_failure_mapper.dart';
import 'package:quanlymaygiat/features/auth/data/auth_interceptor.dart';
import 'package:quanlymaygiat/features/auth/data/auth_local_store.dart';
import 'package:quanlymaygiat/features/auth/data/auth_session_notifier.dart';

/// Builds the configured [Dio] instance (auth, logging, error-mapping).
@lazySingleton
class DioClient {
  DioClient(this._config, this._logger, this._store, this._sessionNotifier);

  final AppConfig _config;
  final AppLogger _logger;
  final AuthLocalStore _store;
  final AuthSessionNotifier _sessionNotifier;

  Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: _config.baseUrl,
        connectTimeout: Duration(milliseconds: _config.connectTimeoutMs),
        receiveTimeout: Duration(milliseconds: _config.receiveTimeoutMs),
        sendTimeout: Duration(milliseconds: _config.sendTimeoutMs),
        headers: const {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([
      AuthInterceptor(_store, _sessionNotifier),
      if (_config.enableLogging) _LoggingInterceptor(_logger),
      _ErrorInterceptor(),
    ]);
    return dio;
  }
}

class _LoggingInterceptor extends Interceptor {
  _LoggingInterceptor(this._logger);

  final AppLogger _logger;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.debug('→ ${options.method} ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.debug('← ${response.statusCode} ${response.requestOptions.uri}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.error('← ERROR ${err.requestOptions.uri}', err);
    handler.next(err);
  }
}

/// Converts a [DioException] into one carrying a domain [Failure] in `error`,
/// so repositories can surface a friendly message.
class _ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final failure = mapDioExceptionToFailure(err);
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        error: failure,
        response: err.response,
        type: err.type,
      ),
    );
  }
}

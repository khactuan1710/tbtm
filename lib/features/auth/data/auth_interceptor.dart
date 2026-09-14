import 'package:dio/dio.dart';
import 'package:quanlymaygiat/features/auth/data/auth_local_store.dart';
import 'package:quanlymaygiat/features/auth/data/auth_session_notifier.dart';

/// Attaches the Bearer token to every request and signals session expiry on a
/// 401 so the shell can route back to login.
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._store, this._sessionNotifier);

  final AuthLocalStore _store;
  final AuthSessionNotifier _sessionNotifier;

  static const _publicPaths = {'/login', '/bankcodes'};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final isPublic = _publicPaths.any((p) => options.path.endsWith(p));
    final token = _store.token;
    if (!isPublic && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401 && _store.isLoggedIn) {
      _sessionNotifier.notifySessionExpired();
    }
    handler.next(err);
  }
}

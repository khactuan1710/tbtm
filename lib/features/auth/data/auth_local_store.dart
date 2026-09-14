import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:quanlymaygiat/features/auth/domain/entities/auth_user.dart';

/// Persists the authenticated session (token + user) in secure storage and
/// keeps an in-memory cache for synchronous reads.
@lazySingleton
class AuthLocalStore {
  AuthLocalStore(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  static const String _userKey = 'auth_user';

  AuthUser? _cached;

  AuthUser? get currentUser => _cached;
  String get token => _cached?.token ?? '';
  bool get isLoggedIn => (_cached?.token ?? '').isNotEmpty;

  /// Loads the persisted session into the in-memory cache. Call once at startup.
  Future<AuthUser?> restore() async {
    final raw = await _secureStorage.read(key: _userKey);
    if (raw == null || raw.isEmpty) return null;
    try {
      _cached = AuthUser.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      _cached = null;
    }
    return _cached;
  }

  Future<void> saveSession(AuthUser user) async {
    _cached = user;
    await _secureStorage.write(key: _userKey, value: jsonEncode(user.toJson()));
  }

  Future<void> clear() async {
    _cached = null;
    await _secureStorage.delete(key: _userKey);
  }
}

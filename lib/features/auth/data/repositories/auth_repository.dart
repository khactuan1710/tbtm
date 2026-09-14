import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:quanlymaygiat/core/network/model/api_response.dart';
import 'package:quanlymaygiat/core/network/repository_runner.dart';
import 'package:quanlymaygiat/core/utils/typedefs.dart';
import 'package:quanlymaygiat/features/auth/data/auth_local_store.dart';
import 'package:quanlymaygiat/features/auth/data/models/login_data_dto.dart';
import 'package:quanlymaygiat/features/auth/data/models/login_request_dto.dart';
import 'package:quanlymaygiat/features/auth/data/services/auth_api_service.dart';
import 'package:quanlymaygiat/features/auth/domain/entities/auth_user.dart';

abstract class AuthRepository {
  Future<Result<ApiResponse<LoginDataDto>>> login(String username, String password);
  Future<void> persistSession(AuthUser user);
  Future<void> logout();
  AuthUser? get currentUser;
}

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._api, this._store);

  final AuthApiService _api;
  final AuthLocalStore _store;

  @override
  Future<Result<ApiResponse<LoginDataDto>>> login(
    String username,
    String password,
  ) {
    return runSafely(() async {
      final response = await _api.login(
        LoginRequestDto(username: username, password: password),
      );
      return right(response);
    });
  }

  @override
  Future<void> persistSession(AuthUser user) => _store.saveSession(user);

  @override
  Future<void> logout() => _store.clear();

  @override
  AuthUser? get currentUser => _store.currentUser;
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:quanlymaygiat/core/network/model/api_response.dart';
import 'package:quanlymaygiat/core/network/model/simple_response.dart';
import 'package:quanlymaygiat/core/network/repository_runner.dart';
import 'package:quanlymaygiat/core/utils/typedefs.dart';
import 'package:quanlymaygiat/features/users/data/models/bank_code_dto.dart';
import 'package:quanlymaygiat/features/users/data/models/change_password_request_dto.dart';
import 'package:quanlymaygiat/features/users/data/models/register_request_dto.dart';
import 'package:quanlymaygiat/features/users/data/models/update_user_request_dto.dart';
import 'package:quanlymaygiat/features/users/data/models/user_dto.dart';
import 'package:quanlymaygiat/features/users/data/services/users_api_service.dart';

abstract class UsersRepository {
  Future<Result<ApiResponse<List<UserDto>>>> getUsers();
  Future<Result<SimpleResponse>> updateUser(
    String userId,
    UpdateUserRequestDto request,
  );
  Future<Result<SimpleResponse>> register(RegisterRequestDto request);
  Future<Result<SimpleResponse>> changePassword(
    ChangePasswordRequestDto request,
  );
  Future<Result<ApiResponse<List<BankCodeDto>>>> getBankCodes();
}

@LazySingleton(as: UsersRepository)
class UsersRepositoryImpl implements UsersRepository {
  UsersRepositoryImpl(this._api);

  final UsersApiService _api;

  @override
  Future<Result<ApiResponse<List<UserDto>>>> getUsers() =>
      runSafely(() async => right(await _api.getUsers()));

  @override
  Future<Result<SimpleResponse>> updateUser(
    String userId,
    UpdateUserRequestDto request,
  ) => runSafely(() async => right(await _api.updateUser(userId, request)));

  @override
  Future<Result<SimpleResponse>> register(RegisterRequestDto request) =>
      runSafely(() async => right(await _api.register(request)));

  @override
  Future<Result<SimpleResponse>> changePassword(
    ChangePasswordRequestDto request,
  ) => runSafely(() async => right(await _api.changePassword(request)));

  @override
  Future<Result<ApiResponse<List<BankCodeDto>>>> getBankCodes() =>
      runSafely(() async => right(await _api.getBankCodes()));
}

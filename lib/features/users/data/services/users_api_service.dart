import 'package:dio/dio.dart';
import 'package:quanlymaygiat/core/network/model/api_response.dart';
import 'package:quanlymaygiat/core/network/model/simple_response.dart';
import 'package:quanlymaygiat/features/users/data/models/bank_code_dto.dart';
import 'package:quanlymaygiat/features/users/data/models/change_password_request_dto.dart';
import 'package:quanlymaygiat/features/users/data/models/register_request_dto.dart';
import 'package:quanlymaygiat/features/users/data/models/update_user_request_dto.dart';
import 'package:quanlymaygiat/features/users/data/models/user_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'users_api_service.g.dart';

@RestApi()
abstract class UsersApiService {
  factory UsersApiService(Dio dio, {String baseUrl}) = _UsersApiService;

  @GET('/users')
  Future<ApiResponse<List<UserDto>>> getUsers();

  @PUT('/users/{userId}')
  Future<SimpleResponse> updateUser(
    @Path('userId') String userId,
    @Body() UpdateUserRequestDto request,
  );

  @POST('/register')
  Future<SimpleResponse> register(@Body() RegisterRequestDto request);

  @POST('/change-password')
  Future<SimpleResponse> changePassword(
    @Body() ChangePasswordRequestDto request,
  );

  @GET('/bankcodes')
  Future<ApiResponse<List<BankCodeDto>>> getBankCodes();
}

import 'package:dio/dio.dart';
import 'package:quanlymaygiat/core/network/model/api_response.dart';
import 'package:quanlymaygiat/features/auth/data/models/login_data_dto.dart';
import 'package:quanlymaygiat/features/auth/data/models/login_request_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST('/login')
  Future<ApiResponse<LoginDataDto>> login(@Body() LoginRequestDto request);
}

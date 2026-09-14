import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quanlymaygiat/features/auth/data/services/auth_api_service.dart';

@module
abstract class AuthModule {
  @lazySingleton
  AuthApiService authApiService(Dio dio) => AuthApiService(dio);
}

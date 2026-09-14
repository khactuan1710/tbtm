import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quanlymaygiat/features/users/data/services/users_api_service.dart';

@module
abstract class UsersModule {
  @lazySingleton
  UsersApiService usersApiService(Dio dio) => UsersApiService(dio);
}

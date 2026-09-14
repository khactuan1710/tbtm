import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quanlymaygiat/features/devices/data/services/devices_api_service.dart';

@module
abstract class DevicesModule {
  @lazySingleton
  DevicesApiService devicesApiService(Dio dio) => DevicesApiService(dio);
}

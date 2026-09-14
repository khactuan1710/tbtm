import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quanlymaygiat/core/network/dio_client.dart';

/// Exposes the configured [Dio] built by [DioClient] to DI.
@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(DioClient client) => client.create();
}

import 'package:dio/dio.dart';
import 'package:quanlymaygiat/core/network/model/api_response.dart';
import 'package:quanlymaygiat/core/network/model/simple_response.dart';
import 'package:quanlymaygiat/features/devices/data/models/create_device_request_dto.dart';
import 'package:quanlymaygiat/features/devices/data/models/device_dto.dart';
import 'package:quanlymaygiat/features/devices/data/models/toggle_device_request_dto.dart';
import 'package:quanlymaygiat/features/devices/data/models/update_device_request_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'devices_api_service.g.dart';

@RestApi()
abstract class DevicesApiService {
  factory DevicesApiService(Dio dio, {String baseUrl}) = _DevicesApiService;

  @GET('/devices')
  Future<ApiResponse<List<DeviceDto>>> getDevices();

  @GET('/devices')
  Future<ApiResponse<List<DeviceDto>>> getDevicesByHost(
    @Query('hostID') String hostId,
  );

  @POST('/turndevices')
  Future<SimpleResponse> toggleDevice(@Body() ToggleDeviceRequestDto request);

  @POST('/devices')
  Future<SimpleResponse> createDevice(@Body() CreateDeviceRequestDto request);

  @PUT('/devices/{deviceID}')
  Future<SimpleResponse> updateDevice(
    @Path('deviceID') String deviceId,
    @Body() UpdateDeviceRequestDto request,
  );
}

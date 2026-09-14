import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:quanlymaygiat/core/network/model/api_response.dart';
import 'package:quanlymaygiat/core/network/model/simple_response.dart';
import 'package:quanlymaygiat/core/network/repository_runner.dart';
import 'package:quanlymaygiat/core/utils/typedefs.dart';
import 'package:quanlymaygiat/features/devices/data/models/create_device_request_dto.dart';
import 'package:quanlymaygiat/features/devices/data/models/device_dto.dart';
import 'package:quanlymaygiat/features/devices/data/models/toggle_device_request_dto.dart';
import 'package:quanlymaygiat/features/devices/data/models/update_device_request_dto.dart';
import 'package:quanlymaygiat/features/devices/data/services/devices_api_service.dart';

abstract class DevicesRepository {
  Future<Result<ApiResponse<List<DeviceDto>>>> getDevices({String? hostId});
  Future<Result<SimpleResponse>> toggleDevice(ToggleDeviceRequestDto request);
  Future<Result<SimpleResponse>> createDevice(CreateDeviceRequestDto request);
  Future<Result<SimpleResponse>> updateDevice(
    String deviceId,
    UpdateDeviceRequestDto request,
  );
}

@LazySingleton(as: DevicesRepository)
class DevicesRepositoryImpl implements DevicesRepository {
  DevicesRepositoryImpl(this._api);

  final DevicesApiService _api;

  @override
  Future<Result<ApiResponse<List<DeviceDto>>>> getDevices({String? hostId}) {
    return runSafely(() async {
      final response = hostId == null || hostId.isEmpty
          ? await _api.getDevices()
          : await _api.getDevicesByHost(hostId);
      return right(response);
    });
  }

  @override
  Future<Result<SimpleResponse>> toggleDevice(ToggleDeviceRequestDto request) {
    return runSafely(() async => right(await _api.toggleDevice(request)));
  }

  @override
  Future<Result<SimpleResponse>> createDevice(CreateDeviceRequestDto request) {
    return runSafely(() async => right(await _api.createDevice(request)));
  }

  @override
  Future<Result<SimpleResponse>> updateDevice(
    String deviceId,
    UpdateDeviceRequestDto request,
  ) {
    return runSafely(
      () async => right(await _api.updateDevice(deviceId, request)),
    );
  }
}

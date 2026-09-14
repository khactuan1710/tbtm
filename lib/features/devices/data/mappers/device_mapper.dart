import 'package:quanlymaygiat/features/devices/data/models/device_dto.dart';
import 'package:quanlymaygiat/features/devices/data/models/service_dto.dart';
import 'package:quanlymaygiat/features/devices/domain/entities/device_entity.dart';
import 'package:quanlymaygiat/features/devices/domain/entities/service_entity.dart';

/// Converts device/service DTOs to domain entities and back.
class DeviceMapper {
  const DeviceMapper();

  ServiceEntity serviceToEntity(ServiceDto dto) => ServiceEntity(
    id: dto.id ?? '',
    serviceName: dto.serviceName ?? '',
    price: dto.price ?? 0,
    totalMinutes: dto.totalMinutes ?? 0,
  );

  ServiceDto serviceToDto(ServiceEntity e) => ServiceDto(
    id: e.id.isEmpty ? null : e.id,
    serviceName: e.serviceName,
    price: e.price,
    totalMinutes: e.totalMinutes,
  );

  DeviceEntity toEntity(DeviceDto dto) => DeviceEntity(
    deviceId: dto.deviceID ?? '',
    currentStatus: dto.currentStatus ?? '',
    deviceName: dto.deviceName ?? '',
    deviceFullName: dto.deviceFullName ?? '',
    userId: dto.userID ?? '',
    deviceType: dto.deviceType ?? '',
    machineType: dto.machineType ?? '',
    address: dto.address ?? '',
    percentAppDeducted: dto.percentAppDeducted?.toDouble(),
    services:
        (dto.services ?? const []).map(serviceToEntity).toList(growable: false),
  );

  List<DeviceEntity> toEntities(List<DeviceDto>? dtos) =>
      (dtos ?? const []).map(toEntity).toList(growable: false);
}

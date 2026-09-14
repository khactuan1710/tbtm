import 'package:json_annotation/json_annotation.dart';
import 'package:quanlymaygiat/features/devices/data/models/service_dto.dart';

part 'device_dto.g.dart';

/// A washing machine device returned by `/devices`.
@JsonSerializable()
class DeviceDto {
  const DeviceDto({
    this.deviceID,
    this.currentStatus,
    this.deviceName,
    this.deviceFullName,
    this.userID,
    this.deviceType,
    this.machineType,
    this.percentAppDeducted,
    this.address,
    this.services,
  });

  @JsonKey(name: 'deviceID')
  final String? deviceID;
  @JsonKey(name: 'currentStatus')
  final String? currentStatus;
  @JsonKey(name: 'deviceName')
  final String? deviceName;
  @JsonKey(name: 'deviceFullName')
  final String? deviceFullName;
  @JsonKey(name: 'userID')
  final String? userID;
  @JsonKey(name: 'deviceType')
  final String? deviceType;
  @JsonKey(name: 'machineType')
  final String? machineType;
  @JsonKey(name: 'percentAppDeducted')
  final num? percentAppDeducted;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'services')
  final List<ServiceDto>? services;

  factory DeviceDto.fromJson(Map<String, dynamic> json) =>
      _$DeviceDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceDtoToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
import 'package:quanlymaygiat/features/devices/data/models/service_dto.dart';

part 'create_device_request_dto.g.dart';

/// Body for `POST /devices` — register a new machine.
@JsonSerializable()
class CreateDeviceRequestDto {
  const CreateDeviceRequestDto({
    required this.accountID,
    required this.deviceName,
    required this.deviceFullName,
    required this.deviceID,
    required this.deviceType,
    required this.machineType,
    this.latitude,
    this.longitude,
    this.percentAppDeducted,
    this.address,
    this.services,
  });

  @JsonKey(name: 'accountID')
  final String accountID;
  @JsonKey(name: 'deviceName')
  final String deviceName;
  @JsonKey(name: 'deviceFullName')
  final String deviceFullName;
  @JsonKey(name: 'deviceID')
  final String deviceID;
  @JsonKey(name: 'deviceType')
  final String deviceType;
  @JsonKey(name: 'machineType')
  final String machineType;
  @JsonKey(name: 'latitude')
  final String? latitude;
  @JsonKey(name: 'longitude')
  final String? longitude;
  @JsonKey(name: 'percentAppDeducted')
  final num? percentAppDeducted;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'services')
  final List<ServiceDto>? services;

  factory CreateDeviceRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreateDeviceRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CreateDeviceRequestDtoToJson(this);
}

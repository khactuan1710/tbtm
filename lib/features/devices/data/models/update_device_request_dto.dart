import 'package:json_annotation/json_annotation.dart';
import 'package:quanlymaygiat/features/devices/data/models/service_dto.dart';

part 'update_device_request_dto.g.dart';

/// Body for `PUT /devices/{deviceID}` — update machine configuration.
@JsonSerializable(includeIfNull: false)
class UpdateDeviceRequestDto {
  const UpdateDeviceRequestDto({
    this.userID,
    this.services,
    this.deviceType,
    this.machineType,
    this.address,
    this.percentAppDeducted,
  });

  @JsonKey(name: 'userID')
  final String? userID;
  @JsonKey(name: 'services')
  final List<ServiceDto>? services;
  @JsonKey(name: 'deviceType')
  final String? deviceType;
  @JsonKey(name: 'machineType')
  final String? machineType;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'percentAppDeducted')
  final num? percentAppDeducted;

  factory UpdateDeviceRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateDeviceRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateDeviceRequestDtoToJson(this);
}

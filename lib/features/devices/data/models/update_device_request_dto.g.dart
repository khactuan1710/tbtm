// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_device_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateDeviceRequestDto _$UpdateDeviceRequestDtoFromJson(
  Map<String, dynamic> json,
) => UpdateDeviceRequestDto(
  userID: json['userID'] as String?,
  services: (json['services'] as List<dynamic>?)
      ?.map((e) => ServiceDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  deviceType: json['deviceType'] as String?,
  machineType: json['machineType'] as String?,
  address: json['address'] as String?,
  percentAppDeducted: json['percentAppDeducted'] as num?,
);

Map<String, dynamic> _$UpdateDeviceRequestDtoToJson(
  UpdateDeviceRequestDto instance,
) => <String, dynamic>{
  'userID': ?instance.userID,
  'services': ?instance.services,
  'deviceType': ?instance.deviceType,
  'machineType': ?instance.machineType,
  'address': ?instance.address,
  'percentAppDeducted': ?instance.percentAppDeducted,
};

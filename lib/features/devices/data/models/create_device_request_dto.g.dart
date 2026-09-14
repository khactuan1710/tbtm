// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_device_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateDeviceRequestDto _$CreateDeviceRequestDtoFromJson(
  Map<String, dynamic> json,
) => CreateDeviceRequestDto(
  accountID: json['accountID'] as String,
  deviceName: json['deviceName'] as String,
  deviceFullName: json['deviceFullName'] as String,
  deviceID: json['deviceID'] as String,
  deviceType: json['deviceType'] as String,
  machineType: json['machineType'] as String,
  latitude: json['latitude'] as String?,
  longitude: json['longitude'] as String?,
  percentAppDeducted: json['percentAppDeducted'] as num?,
  address: json['address'] as String?,
  services: (json['services'] as List<dynamic>?)
      ?.map((e) => ServiceDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CreateDeviceRequestDtoToJson(
  CreateDeviceRequestDto instance,
) => <String, dynamic>{
  'accountID': instance.accountID,
  'deviceName': instance.deviceName,
  'deviceFullName': instance.deviceFullName,
  'deviceID': instance.deviceID,
  'deviceType': instance.deviceType,
  'machineType': instance.machineType,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'percentAppDeducted': instance.percentAppDeducted,
  'address': instance.address,
  'services': instance.services,
};

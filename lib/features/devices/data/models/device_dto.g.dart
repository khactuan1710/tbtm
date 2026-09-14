// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceDto _$DeviceDtoFromJson(Map<String, dynamic> json) => DeviceDto(
  deviceID: json['deviceID'] as String?,
  currentStatus: json['currentStatus'] as String?,
  deviceName: json['deviceName'] as String?,
  deviceFullName: json['deviceFullName'] as String?,
  userID: json['userID'] as String?,
  deviceType: json['deviceType'] as String?,
  machineType: json['machineType'] as String?,
  percentAppDeducted: json['percentAppDeducted'] as num?,
  address: json['address'] as String?,
  services: (json['services'] as List<dynamic>?)
      ?.map((e) => ServiceDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DeviceDtoToJson(DeviceDto instance) => <String, dynamic>{
  'deviceID': instance.deviceID,
  'currentStatus': instance.currentStatus,
  'deviceName': instance.deviceName,
  'deviceFullName': instance.deviceFullName,
  'userID': instance.userID,
  'deviceType': instance.deviceType,
  'machineType': instance.machineType,
  'percentAppDeducted': instance.percentAppDeducted,
  'address': instance.address,
  'services': instance.services,
};

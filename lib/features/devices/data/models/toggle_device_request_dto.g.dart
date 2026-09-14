// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggle_device_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToggleDeviceRequestDto _$ToggleDeviceRequestDtoFromJson(
  Map<String, dynamic> json,
) => ToggleDeviceRequestDto(
  deviceId: json['deviceId'] as String,
  isOnOff: (json['isOnOff'] as num).toInt(),
  duration: (json['duration'] as num).toInt(),
);

Map<String, dynamic> _$ToggleDeviceRequestDtoToJson(
  ToggleDeviceRequestDto instance,
) => <String, dynamic>{
  'deviceId': instance.deviceId,
  'isOnOff': instance.isOnOff,
  'duration': instance.duration,
};

import 'package:json_annotation/json_annotation.dart';

part 'toggle_device_request_dto.g.dart';

/// Body for `POST /turndevices` — turn a device on/off for a duration.
@JsonSerializable()
class ToggleDeviceRequestDto {
  const ToggleDeviceRequestDto({
    required this.deviceId,
    required this.isOnOff,
    required this.duration,
  });

  @JsonKey(name: 'deviceId')
  final String deviceId;

  /// 1 = on, 0 = off.
  @JsonKey(name: 'isOnOff')
  final int isOnOff;

  /// Minutes to keep the device on.
  @JsonKey(name: 'duration')
  final int duration;

  factory ToggleDeviceRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ToggleDeviceRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ToggleDeviceRequestDtoToJson(this);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quanlymaygiat/features/devices/domain/entities/service_entity.dart';

part 'device_entity.freezed.dart';

@freezed
abstract class DeviceEntity with _$DeviceEntity {
  const DeviceEntity._();

  const factory DeviceEntity({
    @Default('') String deviceId,
    @Default('') String currentStatus,
    @Default('') String deviceName,
    @Default('') String deviceFullName,
    @Default('') String userId,
    @Default('') String deviceType,
    @Default('') String machineType,
    @Default('') String address,
    double? percentAppDeducted,
    @Default(<ServiceEntity>[]) List<ServiceEntity> services,
  }) = _DeviceEntity;

  bool get isOn => currentStatus.toLowerCase() == 'on';

  String get displayName =>
      deviceFullName.isNotEmpty ? deviceFullName : deviceName;
}

part of 'device_detail_cubit.dart';

@freezed
abstract class DeviceDetailState with _$DeviceDetailState {
  const factory DeviceDetailState({
    @Default(DeviceEntity()) DeviceEntity device,
    @Default('') String ownerName,
    @Default(false) bool isSaving,
    @Default(false) bool didChange,
  }) = _DeviceDetailState;

  const DeviceDetailState._();
}

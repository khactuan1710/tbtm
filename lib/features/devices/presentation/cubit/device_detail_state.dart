part of 'device_detail_cubit.dart';

@freezed
abstract class DeviceDetailState with _$DeviceDetailState {
  const factory DeviceDetailState({
    @Default(DeviceEntity()) DeviceEntity device,
    @Default('') String ownerName,
    @Default(false) bool isSaving,
    @Default(false) bool didChange,
    // Toàn bộ tài khoản (chủ trọ) — để admin chọn khi gán lại thiết bị sang
    // chủ khác (owner_picker.dart, giống màn Tạo thiết bị).
    @Default(<UserEntity>[]) List<UserEntity> owners,
  }) = _DeviceDetailState;

  const DeviceDetailState._();
}

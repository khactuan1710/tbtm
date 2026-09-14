part of 'create_device_cubit.dart';

@freezed
abstract class CreateDeviceState with _$CreateDeviceState {
  const factory CreateDeviceState({
    @Default(<UserEntity>[]) List<UserEntity> owners,
    UserEntity? selectedOwner,
    @Default(<ServiceEntity>[]) List<ServiceEntity> services,
    @Default(false) bool isSubmitting,
    @Default(false) bool didCreate,
  }) = _CreateDeviceState;

  const CreateDeviceState._();
}

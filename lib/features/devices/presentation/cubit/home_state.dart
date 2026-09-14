part of 'home_cubit.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(true) bool isLoading,
    @Default(false) bool hasError,
    @Default(<DeviceEntity>[]) List<DeviceEntity> allDevices,
    @Default(<DeviceEntity>[]) List<DeviceEntity> devices,
    @Default('') String query,
    @Default(30) int defaultMinutes,
    AuthUser? user,
    String? togglingDeviceId,
  }) = _HomeState;

  const HomeState._();

  int get runningCount => allDevices.where((d) => d.isOn).length;
  int get totalCount => allDevices.length;
}

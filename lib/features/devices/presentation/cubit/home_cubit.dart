import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quanlymaygiat/core/base/base_cubit.dart';
import 'package:quanlymaygiat/core/network/model/api_response.dart';
import 'package:quanlymaygiat/features/auth/data/auth_local_store.dart';
import 'package:quanlymaygiat/features/auth/data/repositories/auth_repository.dart';
import 'package:quanlymaygiat/features/auth/domain/entities/auth_user.dart';
import 'package:quanlymaygiat/features/devices/data/device_settings_store.dart';
import 'package:quanlymaygiat/features/devices/data/mappers/device_mapper.dart';
import 'package:quanlymaygiat/features/devices/data/models/device_dto.dart';
import 'package:quanlymaygiat/features/devices/data/models/toggle_device_request_dto.dart';
import 'package:quanlymaygiat/features/devices/data/repositories/devices_repository.dart';
import 'package:quanlymaygiat/features/devices/domain/entities/device_entity.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

@injectable
class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit(
    this._repository,
    this._authStore,
    this._authRepository,
    this._settingsStore,
  ) : super(const HomeState());

  final DevicesRepository _repository;
  final AuthLocalStore _authStore;
  final AuthRepository _authRepository;
  final DeviceSettingsStore _settingsStore;
  final DeviceMapper _mapper = const DeviceMapper();

  void init() {
    emit(
      state.copyWith(
        user: _authStore.currentUser,
        defaultMinutes: _settingsStore.defaultMinutes,
      ),
    );
    loadDevices();
  }

  Future<void> loadDevices({bool showLoadingUi = true}) async {
    if (showLoadingUi) emit(state.copyWith(isLoading: true, hasError: false));

    final response = await executeResult<ApiResponse<List<DeviceDto>>>(
      () => _repository.getDevices(),
      isLoading: false,
    );

    if (response == null) {
      emit(state.copyWith(isLoading: false, hasError: state.allDevices.isEmpty));
      return;
    }

    final devices = _mapper.toEntities(response.data);
    emit(state.copyWith(isLoading: false, hasError: false, allDevices: devices));
    _applyFilter(state.query);
  }

  void search(String query) {
    emit(state.copyWith(query: query));
    _applyFilter(query);
  }

  void _applyFilter(String query) {
    if (query.trim().isEmpty) {
      emit(state.copyWith(devices: state.allDevices));
      return;
    }
    final q = query.toLowerCase();
    final filtered = state.allDevices
        .where(
          (d) =>
              d.displayName.toLowerCase().contains(q) ||
              d.deviceId.toLowerCase().contains(q),
        )
        .toList(growable: false);
    emit(state.copyWith(devices: filtered));
  }

  Future<void> setDefaultMinutes(int minutes) async {
    if (minutes <= 0) return;
    await _settingsStore.setDefaultMinutes(minutes);
    emit(state.copyWith(defaultMinutes: minutes));
  }

  Future<void> toggleDevice(DeviceEntity device, bool turnOn) async {
    emit(state.copyWith(togglingDeviceId: device.deviceId));

    final result = await executeResult(
      () => _repository.toggleDevice(
        ToggleDeviceRequestDto(
          deviceId: device.deviceId,
          isOnOff: turnOn ? 1 : 0,
          duration: state.defaultMinutes,
        ),
      ),
      isLoading: false,
    );

    emit(state.copyWith(togglingDeviceId: null));
    if (result == null) return;

    _updateDeviceStatus(device.deviceId, turnOn);
    showSuccess(turnOn ? 'Đã bật thiết bị' : 'Đã tắt thiết bị');
  }

  void _updateDeviceStatus(String deviceId, bool isOn) {
    List<DeviceEntity> map(List<DeviceEntity> list) => list
        .map(
          (d) => d.deviceId == deviceId
              ? d.copyWith(currentStatus: isOn ? 'on' : 'off')
              : d,
        )
        .toList(growable: false);

    emit(
      state.copyWith(
        allDevices: map(state.allDevices),
        devices: map(state.devices),
      ),
    );
  }

  Future<void> logout() async {
    await _authRepository.logout();
  }

  AuthUser? get user => _authStore.currentUser;
}

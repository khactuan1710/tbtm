import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quanlymaygiat/core/base/base_cubit.dart';
import 'package:quanlymaygiat/features/devices/data/mappers/device_mapper.dart';
import 'package:quanlymaygiat/features/devices/data/models/update_device_request_dto.dart';
import 'package:quanlymaygiat/features/devices/data/repositories/devices_repository.dart';
import 'package:quanlymaygiat/features/devices/domain/entities/device_entity.dart';
import 'package:quanlymaygiat/features/devices/domain/entities/service_entity.dart';
import 'package:quanlymaygiat/features/users/data/mappers/user_mapper.dart';
import 'package:quanlymaygiat/features/users/data/repositories/users_repository.dart';

part 'device_detail_cubit.freezed.dart';
part 'device_detail_state.dart';

@injectable
class DeviceDetailCubit extends BaseCubit<DeviceDetailState> {
  DeviceDetailCubit(
    this._repository,
    this._usersRepository,
    @factoryParam this._device,
  ) : super(const DeviceDetailState());

  final DevicesRepository _repository;
  final UsersRepository _usersRepository;
  final DeviceEntity _device;
  final DeviceMapper _mapper = const DeviceMapper();
  final UserMapper _userMapper = const UserMapper();

  void init() {
    emit(state.copyWith(device: _device));
    _resolveOwnerName();
  }

  /// Devices only carry the owner's id; look up the matching user so the detail
  /// screen can show the owner's name instead of the raw id.
  Future<void> _resolveOwnerName() async {
    final ownerId = _device.userId;
    if (ownerId.isEmpty) return;
    final res = await executeResult(
      () => _usersRepository.getUsers(),
      isLoading: false,
      onError: (_) {},
    );
    if (res == null) return;
    final users = _userMapper.toEntities(res.data);
    for (final u in users) {
      if (u.id == ownerId || u.username == ownerId) {
        if (u.fullName.isNotEmpty) emit(state.copyWith(ownerName: u.fullName));
        return;
      }
    }
  }

  Future<void> saveChanges({
    required String deviceType,
    required String machineType,
    required String address,
    required double percentAppDeducted,
    required List<ServiceEntity> services,
  }) async {
    emit(state.copyWith(isSaving: true));

    final dto = UpdateDeviceRequestDto(
      userID: state.device.userId,
      deviceType: deviceType,
      machineType: machineType,
      address: address,
      percentAppDeducted: percentAppDeducted,
      services: services.map((e) => _mapper.serviceToDto(e)).toList(),
    );

    final result = await executeResult(
      () => _repository.updateDevice(state.device.deviceId, dto),
      isLoading: false,
    );

    if (result == null) {
      emit(state.copyWith(isSaving: false));
      return;
    }

    emit(
      state.copyWith(
        isSaving: false,
        didChange: true,
        device: state.device.copyWith(
          deviceType: deviceType,
          machineType: machineType,
          address: address,
          percentAppDeducted: percentAppDeducted,
          services: services,
        ),
      ),
    );
    showSuccess('Cập nhật thành công');
  }
}

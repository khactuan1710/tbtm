import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quanlymaygiat/core/base/base_cubit.dart';
import 'package:quanlymaygiat/core/network/model/api_response.dart';
import 'package:quanlymaygiat/features/devices/data/mappers/device_mapper.dart';
import 'package:quanlymaygiat/features/devices/data/models/create_device_request_dto.dart';
import 'package:quanlymaygiat/features/devices/data/repositories/devices_repository.dart';
import 'package:quanlymaygiat/features/devices/domain/entities/service_entity.dart';
import 'package:quanlymaygiat/features/users/data/mappers/user_mapper.dart';
import 'package:quanlymaygiat/features/users/data/models/user_dto.dart';
import 'package:quanlymaygiat/features/users/data/repositories/users_repository.dart';
import 'package:quanlymaygiat/features/users/domain/entities/user_entity.dart';

part 'create_device_cubit.freezed.dart';
part 'create_device_state.dart';

@injectable
class CreateDeviceCubit extends BaseCubit<CreateDeviceState> {
  CreateDeviceCubit(this._devicesRepo, this._usersRepo)
    : super(const CreateDeviceState());

  final DevicesRepository _devicesRepo;
  final UsersRepository _usersRepo;
  final DeviceMapper _deviceMapper = const DeviceMapper();
  final UserMapper _userMapper = const UserMapper();

  Future<void> init() async {
    final resp = await executeResult<ApiResponse<List<UserDto>>>(
      () => _usersRepo.getUsers(),
      isLoading: false,
    );
    if (resp == null) return;
    emit(state.copyWith(owners: _userMapper.toEntities(resp.data)));
  }

  void selectOwner(UserEntity user) {
    emit(state.copyWith(selectedOwner: user));
  }

  void addService(ServiceEntity service) {
    emit(state.copyWith(services: [...state.services, service]));
  }

  void updateServiceAt(int index, ServiceEntity service) {
    if (index < 0 || index >= state.services.length) return;
    final updated = [...state.services];
    updated[index] = service;
    emit(state.copyWith(services: updated));
  }

  void removeServiceAt(int index) {
    if (index < 0 || index >= state.services.length) return;
    final updated = [...state.services]..removeAt(index);
    emit(state.copyWith(services: updated));
  }

  Future<void> submit({
    required String deviceName,
    String deviceFullName = '',
    required String deviceID,
    String deviceType = '',
    String machineType = '',
    String address = '',
    String percentText = '',
  }) async {
    final owner = state.selectedOwner;
    if (owner == null) {
      showError('Vui lòng chọn chủ sở hữu');
      return;
    }

    final name = deviceName.trim();
    final id = deviceID.trim();
    if (name.isEmpty) {
      showError('Vui lòng nhập tên thiết bị');
      return;
    }
    if (id.isEmpty) {
      showError('Vui lòng nhập mã thiết bị');
      return;
    }

    emit(state.copyWith(isSubmitting: true));

    final fullName = deviceFullName.trim();
    final request = CreateDeviceRequestDto(
      accountID: owner.id,
      deviceName: name,
      deviceFullName: fullName.isEmpty ? name : fullName,
      deviceID: id,
      deviceType: deviceType.trim(),
      machineType: machineType.trim(),
      address: address.trim(),
      percentAppDeducted: double.tryParse(percentText.trim()) ?? 0,
      services: state.services
          .map((e) => _deviceMapper.serviceToDto(e))
          .toList(),
    );

    final result = await executeResult(
      () => _devicesRepo.createDevice(request),
      isLoading: false,
    );

    if (result == null) {
      emit(state.copyWith(isSubmitting: false));
      return;
    }

    showSuccess('Thêm thiết bị thành công');
    emit(state.copyWith(isSubmitting: false, didCreate: true));
  }
}

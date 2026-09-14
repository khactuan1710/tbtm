import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quanlymaygiat/core/base/base_cubit.dart';
import 'package:quanlymaygiat/core/network/model/api_response.dart';
import 'package:quanlymaygiat/features/users/data/mappers/user_mapper.dart';
import 'package:quanlymaygiat/features/users/data/models/update_user_request_dto.dart';
import 'package:quanlymaygiat/features/users/data/models/user_dto.dart';
import 'package:quanlymaygiat/features/users/data/repositories/users_repository.dart';
import 'package:quanlymaygiat/features/users/domain/entities/user_entity.dart';

part 'user_manage_cubit.freezed.dart';
part 'user_manage_state.dart';

@injectable
class UserManageCubit extends BaseCubit<UserManageState> {
  UserManageCubit(this._repository) : super(const UserManageState());

  final UsersRepository _repository;
  final UserMapper _mapper = const UserMapper();

  Future<void> loadUsers({bool showLoadingUi = true}) async {
    if (showLoadingUi) emit(state.copyWith(isLoading: true, hasError: false));

    final response = await executeResult<ApiResponse<List<UserDto>>>(
      () => _repository.getUsers(),
      isLoading: false,
    );

    if (response == null) {
      emit(state.copyWith(isLoading: false, hasError: state.allUsers.isEmpty));
      return;
    }

    final users = _mapper.toEntities(response.data);
    emit(state.copyWith(isLoading: false, hasError: false, allUsers: users));
    _applyFilter(state.query);
  }

  void search(String query) {
    emit(state.copyWith(query: query));
    _applyFilter(query);
  }

  void _applyFilter(String query) {
    if (query.trim().isEmpty) {
      emit(state.copyWith(users: state.allUsers));
      return;
    }
    final q = query.trim().toLowerCase();
    final filtered = state.allUsers
        .where(
          (u) =>
              u.fullName.toLowerCase().contains(q) ||
              u.username.toLowerCase().contains(q) ||
              u.phoneNumber.toLowerCase().contains(q),
        )
        .toList(growable: false);
    emit(state.copyWith(users: filtered));
  }

  Future<void> toggleActive(UserEntity user, bool value) async {
    final result = await executeResult(
      () => _repository.updateUser(
        user.id,
        UpdateUserRequestDto(
          isActive: value,
          phoneNumber: user.phoneNumber,
          fullName: user.fullName,
          address: user.address,
          addressNew: user.addressNew,
          bankCode: user.bankCode,
          bankAccountNumber: user.bankAccountNumber,
          bankAccountName: user.bankAccountName,
        ),
      ),
      isLoading: false,
    );

    if (result == null) return;

    _updateUserActive(user.id, value);
    showSuccess(value ? 'Đã mở khoá người dùng' : 'Đã khoá người dùng');
  }

  void _updateUserActive(String userId, bool isActive) {
    List<UserEntity> mapList(List<UserEntity> list) => list
        .map((u) => u.id == userId ? u.copyWith(isActive: isActive) : u)
        .toList(growable: false);

    emit(
      state.copyWith(
        allUsers: mapList(state.allUsers),
        users: mapList(state.users),
      ),
    );
  }
}

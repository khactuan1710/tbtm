import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quanlymaygiat/core/base/base_cubit.dart';
import 'package:quanlymaygiat/features/users/data/models/change_password_request_dto.dart';
import 'package:quanlymaygiat/features/users/data/models/update_user_request_dto.dart';
import 'package:quanlymaygiat/features/users/data/repositories/users_repository.dart';
import 'package:quanlymaygiat/features/users/domain/entities/user_entity.dart';

part 'user_detail_cubit.freezed.dart';
part 'user_detail_state.dart';

@injectable
class UserDetailCubit extends BaseCubit<UserDetailState> {
  UserDetailCubit(this._repository, @factoryParam UserEntity user)
    : super(UserDetailState(user: user));

  final UsersRepository _repository;

  /// Updates the editable profile fields. Preserves the current [isActive] and
  /// [addressNew] values. Returns `true` on success.
  Future<bool> updateInfo({
    required String phoneNumber,
    required String fullName,
    required String address,
    required String bankCode,
    required String bankAccountNumber,
    required String bankAccountName,
  }) async {
    final user = state.user;
    emit(state.copyWith(isSaving: true));

    final result = await executeResult(
      () => _repository.updateUser(
        user.id,
        UpdateUserRequestDto(
          phoneNumber: phoneNumber,
          fullName: fullName,
          address: address,
          isActive: user.isActive,
          addressNew: user.addressNew,
          bankCode: bankCode,
          bankAccountNumber: bankAccountNumber,
          bankAccountName: bankAccountName,
        ),
      ),
      isLoading: false,
    );

    if (result == null) {
      emit(state.copyWith(isSaving: false));
      return false;
    }

    emit(
      state.copyWith(
        isSaving: false,
        didChange: true,
        user: user.copyWith(
          phoneNumber: phoneNumber,
          fullName: fullName,
          address: address,
          bankCode: bankCode,
          bankAccountNumber: bankAccountNumber,
          bankAccountName: bankAccountName,
        ),
      ),
    );
    showSuccess('Cập nhật thông tin thành công');
    return true;
  }

  /// Sets a new password for this user. Returns `true` on success.
  Future<bool> changePassword(String newPassword) async {
    emit(state.copyWith(isSaving: true));

    final result = await executeResult(
      () => _repository.changePassword(
        ChangePasswordRequestDto(
          objId: state.user.id,
          newPassword: newPassword,
        ),
      ),
      isLoading: false,
    );

    emit(state.copyWith(isSaving: false));
    if (result == null) return false;

    showSuccess('Đổi mật khẩu thành công');
    return true;
  }
}

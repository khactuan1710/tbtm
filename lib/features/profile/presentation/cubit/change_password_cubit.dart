import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quanlymaygiat/core/base/base_cubit.dart';
import 'package:quanlymaygiat/core/network/model/simple_response.dart';
import 'package:quanlymaygiat/features/auth/data/auth_local_store.dart';
import 'package:quanlymaygiat/features/users/data/models/change_password_request_dto.dart';
import 'package:quanlymaygiat/features/users/data/repositories/users_repository.dart';

part 'change_password_cubit.freezed.dart';
part 'change_password_state.dart';

@injectable
class ChangePasswordCubit extends BaseCubit<ChangePasswordState> {
  ChangePasswordCubit(this._repo, this._authStore)
    : super(const ChangePasswordState());

  final UsersRepository _repo;
  final AuthLocalStore _authStore;

  Future<void> submit(String newPassword, String confirm) async {
    if (newPassword.isEmpty) {
      showError('Vui lòng nhập mật khẩu mới');
      return;
    }
    if (newPassword.length < 6) {
      showError('Mật khẩu tối thiểu 6 ký tự');
      return;
    }
    if (newPassword != confirm) {
      showError('Mật khẩu xác nhận không khớp');
      return;
    }

    final id = _authStore.currentUser?.userId ?? '';

    emit(state.copyWith(isSubmitting: true));

    final response = await executeResult<SimpleResponse>(
      () => _repo.changePassword(
        ChangePasswordRequestDto(objId: id, newPassword: newPassword),
      ),
      isLoading: false,
    );

    emit(state.copyWith(isSubmitting: false));

    if (response == null) return;

    showSuccess('Đổi mật khẩu thành công');
    emit(state.copyWith(didSucceed: true));
  }
}

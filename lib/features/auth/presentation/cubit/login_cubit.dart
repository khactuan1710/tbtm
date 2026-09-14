import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quanlymaygiat/core/base/base_cubit.dart';
import 'package:quanlymaygiat/core/network/model/api_response.dart';
import 'package:quanlymaygiat/features/auth/data/repositories/auth_repository.dart';
import 'package:quanlymaygiat/features/auth/data/models/login_data_dto.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit(this._repository) : super(const LoginState());

  final AuthRepository _repository;

  Future<void> login(String username, String password) async {
    if (username.trim().isEmpty) {
      showError('Vui lòng nhập tài khoản');
      return;
    }
    if (password.isEmpty) {
      showError('Vui lòng nhập mật khẩu');
      return;
    }

    emit(state.copyWith(isSubmitting: true));

    final response = await executeResult<ApiResponse<LoginDataDto>>(
      () => _repository.login(username.trim(), password),
    );

    if (response == null) {
      emit(state.copyWith(isSubmitting: false));
      return;
    }

    final data = response.data;
    final token = data?.token ?? '';
    if (token.isEmpty) {
      emit(state.copyWith(isSubmitting: false));
      showError(response.message ?? 'Thông tin tài khoản không đúng');
      return;
    }

    await _repository.persistSession(data!.toEntity());
    showSuccess(response.message ?? 'Đăng nhập thành công');
    emit(state.copyWith(isSubmitting: false, isLoginSuccess: true));
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quanlymaygiat/core/base/base_cubit.dart';
import 'package:quanlymaygiat/core/network/model/api_response.dart';
import 'package:quanlymaygiat/core/network/model/simple_response.dart';
import 'package:quanlymaygiat/features/users/data/mappers/user_mapper.dart';
import 'package:quanlymaygiat/features/users/data/models/bank_code_dto.dart';
import 'package:quanlymaygiat/features/users/data/models/register_request_dto.dart';
import 'package:quanlymaygiat/features/users/data/repositories/users_repository.dart';
import 'package:quanlymaygiat/features/users/domain/entities/bank_code_entity.dart';

part 'create_account_cubit.freezed.dart';
part 'create_account_state.dart';

@injectable
class CreateAccountCubit extends BaseCubit<CreateAccountState> {
  CreateAccountCubit(this._repository) : super(const CreateAccountState());

  final UsersRepository _repository;

  Future<void> init() async {
    final response = await executeResult<ApiResponse<List<BankCodeDto>>>(
      () => _repository.getBankCodes(),
      isLoading: false,
    );
    if (response == null) return;
    final banks = const UserMapper().bankToEntities(response.data);
    emit(state.copyWith(bankCodes: banks));
  }

  void selectBank(BankCodeEntity bank) =>
      emit(state.copyWith(selectedBank: bank));

  void setType(String type) => emit(state.copyWith(type: type));

  Future<void> submit({
    required String username,
    required String password,
    required String fullName,
    String? phoneNumber,
    String? address,
    String percentText = '',
    String? bankAccountNumber,
    String? bankAccountName,
  }) async {
    if (username.trim().isEmpty) {
      showError('Vui lòng nhập tên đăng nhập');
      return;
    }
    if (password.isEmpty) {
      showError('Vui lòng nhập mật khẩu');
      return;
    }
    if (fullName.trim().isEmpty) {
      showError('Vui lòng nhập họ tên');
      return;
    }

    emit(state.copyWith(isSubmitting: true));

    final request = RegisterRequestDto(
      username: username.trim(),
      password: password,
      fullName: fullName.trim(),
      phoneNumber: _nullIfEmpty(phoneNumber),
      address: _nullIfEmpty(address),
      percentAppDeducted: double.tryParse(percentText.trim()) ?? 0,
      bankCode: state.selectedBank?.code,
      bankAccountNumber: _nullIfEmpty(bankAccountNumber),
      bankAccountName: _nullIfEmpty(bankAccountName),
      type: state.type,
      addressNew: const [],
    );

    final response = await executeResult<SimpleResponse>(
      () => _repository.register(request),
      isLoading: false,
    );

    emit(state.copyWith(isSubmitting: false));
    if (response == null) return;

    showSuccess('Tạo tài khoản thành công');
    emit(state.copyWith(didCreate: true));
  }

  String? _nullIfEmpty(String? value) {
    final trimmed = value?.trim() ?? '';
    return trimmed.isEmpty ? null : trimmed;
  }
}

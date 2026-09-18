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

/// Dựng [RegisterRequestDto] từ dữ liệu form + validate — hàm THUẦN, tách
/// riêng để test không cần mock network. Trả về `error` (không null) nếu
/// thiếu trường bắt buộc, khi đó `request` là null và ngược lại.
///
/// Server (`POST /register`) bắt buộc TẤT CẢ các trường: username, password,
/// fullName, phoneNumber, addressNew (mảng KHÔNG RỖNG), eWeLinkAccount,
/// eWeLinkPassword, bankCode, bankAccountNumber, bankAccountName, type —
/// thiếu bất kỳ trường nào server trả về đúng 1 thông báo chung "Cần nhập
/// đầy đủ tất cả các trường!" (app.py:1080), không chỉ rõ thiếu trường nào.
/// Validate hết ở đây để báo đúng lỗi cho user.
({RegisterRequestDto? request, String? error}) buildRegisterRequest({
  required String username,
  required String password,
  required String fullName,
  String? phoneNumber,
  String? address,
  String percentText = '',
  String? bankCode,
  String? bankAccountNumber,
  String? bankAccountName,
  String? eWeLinkAccount,
  String? eWeLinkPassword,
  required String type,
}) {
  if (username.trim().isEmpty) {
    return (request: null, error: 'Vui lòng nhập tên đăng nhập');
  }
  if (password.isEmpty) {
    return (request: null, error: 'Vui lòng nhập mật khẩu');
  }
  if (fullName.trim().isEmpty) {
    return (request: null, error: 'Vui lòng nhập họ tên');
  }
  if ((address ?? '').trim().isEmpty) {
    return (request: null, error: 'Vui lòng nhập địa chỉ');
  }
  if ((eWeLinkAccount ?? '').trim().isEmpty) {
    return (request: null, error: 'Vui lòng nhập tài khoản eWeLink');
  }
  if ((eWeLinkPassword ?? '').trim().isEmpty) {
    return (request: null, error: 'Vui lòng nhập mật khẩu eWeLink');
  }

  final trimmedAddress = address!.trim();
  String? nullIfEmpty(String? value) {
    final trimmed = value?.trim() ?? '';
    return trimmed.isEmpty ? null : trimmed;
  }

  return (
    request: RegisterRequestDto(
      username: username.trim(),
      password: password,
      fullName: fullName.trim(),
      phoneNumber: nullIfEmpty(phoneNumber),
      address: trimmedAddress,
      percentAppDeducted: double.tryParse(percentText.trim()) ?? 0,
      eWeLinkAccount: eWeLinkAccount!.trim(),
      eWeLinkPassword: eWeLinkPassword!.trim(),
      bankCode: bankCode,
      bankAccountNumber: nullIfEmpty(bankAccountNumber),
      bankAccountName: nullIfEmpty(bankAccountName),
      // Server lưu type ĐÚNG NGUYÊN VĂN (không tự map) — "host" mới khớp quy
      // ước đang dùng khắp hệ thống (server default, app Android); "user"
      // (giá trị cũ) sẽ tạo dữ liệu lệch chuẩn dù không gãy chức năng.
      type: type == 'admin' ? 'admin' : 'host',
      // addressNew phải là mảng KHÔNG RỖNG (Python coi [] là falsy) — dùng
      // luôn địa chỉ vừa nhập, giống bản chất 1 địa chỉ của app Android
      // (khác app Android ở chỗ họ hỗ trợ thêm NHIỀU địa chỉ; ở đây model
      // UserEntity/màn hình khác trong app chỉ dùng 1 address string nên
      // không cần UI quản lý nhiều địa chỉ).
      addressNew: [trimmedAddress],
    ),
    error: null,
  );
}

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
    String? eWeLinkAccount,
    String? eWeLinkPassword,
  }) async {
    final built = buildRegisterRequest(
      username: username,
      password: password,
      fullName: fullName,
      phoneNumber: phoneNumber,
      address: address,
      percentText: percentText,
      bankCode: state.selectedBank?.code,
      bankAccountNumber: bankAccountNumber,
      bankAccountName: bankAccountName,
      eWeLinkAccount: eWeLinkAccount,
      eWeLinkPassword: eWeLinkPassword,
      type: state.type,
    );
    if (built.error != null) {
      showError(built.error!);
      return;
    }

    emit(state.copyWith(isSubmitting: true));

    final response = await executeResult<SimpleResponse>(
      () => _repository.register(built.request!),
      isLoading: false,
    );

    emit(state.copyWith(isSubmitting: false));
    if (response == null) return;

    showSuccess('Tạo tài khoản thành công');
    emit(state.copyWith(didCreate: true));
  }
}

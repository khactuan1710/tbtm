import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quanlymaygiat/core/base/base_cubit.dart';
import 'package:quanlymaygiat/core/network/model/api_response.dart';
import 'package:quanlymaygiat/features/users/data/models/sepay_config_dto.dart';
import 'package:quanlymaygiat/features/users/data/models/sepay_secret_dto.dart';
import 'package:quanlymaygiat/features/users/data/repositories/users_repository.dart';

part 'sepay_integration_cubit.freezed.dart';
part 'sepay_integration_state.dart';

/// Cho chủ trọ tự lấy hostId/URL webhook của chính mình + tự tạo API Key để
/// dán vào SePay (`GET /me/sepay-config`, `POST /me/sepay-secret/generate`)
/// — khỏi phải hỏi qua lại với người vận hành mỗi lần thêm chủ trọ mới (xem
/// SEPAY_INTEGRATION_PLAN.md mục 7).
@injectable
class SepayIntegrationCubit extends BaseCubit<SepayIntegrationState> {
  SepayIntegrationCubit(this._repo) : super(const SepayIntegrationState());

  final UsersRepository _repo;

  Future<void> load() async {
    emit(state.copyWith(isLoading: true));
    final response = await executeResult<ApiResponse<SepayConfigDto>>(
      () => _repo.getMySepayConfig(),
      isLoading: false,
    );
    emit(state.copyWith(isLoading: false, config: response?.data));
  }

  Future<void> generateSecret() async {
    emit(state.copyWith(isGenerating: true));
    final response = await executeResult<ApiResponse<SepaySecretDto>>(
      () => _repo.generateMySepaySecret(),
      isLoading: false,
    );
    emit(state.copyWith(isGenerating: false));

    final secret = response?.data?.sepayWebhookSecret;
    if (secret == null || secret.isEmpty) return;

    showSuccess('Đã tạo API Key mới');
    emit(
      state.copyWith(
        newSecret: secret,
        config: state.config?.copyWith(hasSepaySecret: true),
      ),
    );
  }
}

extension on SepayConfigDto {
  SepayConfigDto copyWith({bool? hasSepaySecret}) => SepayConfigDto(
    hostId: hostId,
    webhookUrl: webhookUrl,
    hasSepaySecret: hasSepaySecret ?? this.hasSepaySecret,
  );
}

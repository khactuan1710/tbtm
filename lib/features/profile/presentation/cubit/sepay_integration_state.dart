part of 'sepay_integration_cubit.dart';

@freezed
abstract class SepayIntegrationState with _$SepayIntegrationState {
  const factory SepayIntegrationState({
    @Default(false) bool isLoading,
    @Default(false) bool isGenerating,
    SepayConfigDto? config,
    // API Key vừa tạo trong phiên này — chỉ hiện được 1 lần lúc tạo (server
    // không lưu lại nguyên văn để trả về sau), mất khi rời màn hình.
    String? newSecret,
  }) = _SepayIntegrationState;

  const SepayIntegrationState._();
}

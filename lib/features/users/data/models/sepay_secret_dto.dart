import 'package:json_annotation/json_annotation.dart';

part 'sepay_secret_dto.g.dart';

/// `data` của `POST /me/sepay-secret/generate` — API Key mới, trả về ĐÚNG 1
/// LẦN lúc tạo (server không lưu lại nguyên văn để xem sau).
@JsonSerializable()
class SepaySecretDto {
  const SepaySecretDto({this.sepayWebhookSecret});

  @JsonKey(name: 'sepayWebhookSecret')
  final String? sepayWebhookSecret;

  factory SepaySecretDto.fromJson(Map<String, dynamic> json) =>
      _$SepaySecretDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SepaySecretDtoToJson(this);
}

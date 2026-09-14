import 'package:json_annotation/json_annotation.dart';

part 'sepay_config_dto.g.dart';

/// `data` của `GET /me/sepay-config` — hostId + URL webhook của chính tài
/// khoản đang đăng nhập, và cờ báo đã có secret hay chưa (KHÔNG lộ giá trị
/// secret hiện có, chỉ `POST /me/sepay-secret/generate` mới trả secret).
@JsonSerializable()
class SepayConfigDto {
  const SepayConfigDto({this.hostId, this.webhookUrl, this.hasSepaySecret});

  @JsonKey(name: 'hostId')
  final String? hostId;
  @JsonKey(name: 'webhookUrl')
  final String? webhookUrl;
  @JsonKey(name: 'hasSepaySecret')
  final bool? hasSepaySecret;

  factory SepayConfigDto.fromJson(Map<String, dynamic> json) =>
      _$SepayConfigDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SepayConfigDtoToJson(this);
}

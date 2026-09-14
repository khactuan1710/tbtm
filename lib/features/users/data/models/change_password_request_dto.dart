import 'package:json_annotation/json_annotation.dart';

part 'change_password_request_dto.g.dart';

/// Body for `POST /change-password`.
@JsonSerializable()
class ChangePasswordRequestDto {
  const ChangePasswordRequestDto({
    required this.objId,
    required this.newPassword,
  });

  @JsonKey(name: 'obj_id')
  final String objId;
  @JsonKey(name: 'newPassword')
  final String newPassword;

  factory ChangePasswordRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ChangePasswordRequestDtoToJson(this);
}

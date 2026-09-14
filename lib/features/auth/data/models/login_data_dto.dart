import 'package:json_annotation/json_annotation.dart';
import 'package:quanlymaygiat/features/auth/domain/entities/auth_user.dart';

part 'login_data_dto.g.dart';

/// Payload of the `/login` response `data` object.
@JsonSerializable()
class LoginDataDto {
  const LoginDataDto({
    this.fullName,
    this.token,
    this.type,
    this.userID,
    this.username,
  });

  @JsonKey(name: 'fullName')
  final String? fullName;
  @JsonKey(name: 'token')
  final String? token;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'userID')
  final String? userID;
  @JsonKey(name: 'username')
  final String? username;

  factory LoginDataDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDataDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDataDtoToJson(this);

  AuthUser toEntity() => AuthUser(
    userId: userID ?? '',
    username: username ?? '',
    fullName: fullName ?? '',
    type: type ?? '',
    token: token ?? '',
  );
}

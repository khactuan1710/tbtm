// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDataDto _$LoginDataDtoFromJson(Map<String, dynamic> json) => LoginDataDto(
  fullName: json['fullName'] as String?,
  token: json['token'] as String?,
  type: json['type'] as String?,
  userID: json['userID'] as String?,
  username: json['username'] as String?,
);

Map<String, dynamic> _$LoginDataDtoToJson(LoginDataDto instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'token': instance.token,
      'type': instance.type,
      'userID': instance.userID,
      'username': instance.username,
    };

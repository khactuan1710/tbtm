// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthUser _$AuthUserFromJson(Map<String, dynamic> json) => _AuthUser(
  userId: json['userId'] as String? ?? '',
  username: json['username'] as String? ?? '',
  fullName: json['fullName'] as String? ?? '',
  type: json['type'] as String? ?? '',
  token: json['token'] as String? ?? '',
);

Map<String, dynamic> _$AuthUserToJson(_AuthUser instance) => <String, dynamic>{
  'userId': instance.userId,
  'username': instance.username,
  'fullName': instance.fullName,
  'type': instance.type,
  'token': instance.token,
};

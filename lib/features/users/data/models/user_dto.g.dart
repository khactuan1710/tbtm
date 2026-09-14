// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
  id: json['_id'] as String?,
  address: json['address'] as String?,
  fullName: json['fullName'] as String?,
  isActive: json['isActive'] as bool?,
  phoneNumber: json['phoneNumber'] as String?,
  type: json['type'] as String?,
  username: json['username'] as String?,
  addressNew: (json['addressNew'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  bankCode: json['bankCode'] as String?,
  bankAccountNumber: json['bankAccountNumber'] as String?,
  bankAccountName: json['bankAccountName'] as String?,
);

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
  '_id': instance.id,
  'address': instance.address,
  'fullName': instance.fullName,
  'isActive': instance.isActive,
  'phoneNumber': instance.phoneNumber,
  'type': instance.type,
  'username': instance.username,
  'addressNew': instance.addressNew,
  'bankCode': instance.bankCode,
  'bankAccountNumber': instance.bankAccountNumber,
  'bankAccountName': instance.bankAccountName,
};

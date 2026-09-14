// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserRequestDto _$UpdateUserRequestDtoFromJson(
  Map<String, dynamic> json,
) => UpdateUserRequestDto(
  phoneNumber: json['phoneNumber'] as String?,
  fullName: json['fullName'] as String?,
  address: json['address'] as String?,
  isActive: json['isActive'] as bool?,
  addressNew: (json['addressNew'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  bankCode: json['bankCode'] as String?,
  bankAccountNumber: json['bankAccountNumber'] as String?,
  bankAccountName: json['bankAccountName'] as String?,
);

Map<String, dynamic> _$UpdateUserRequestDtoToJson(
  UpdateUserRequestDto instance,
) => <String, dynamic>{
  'phoneNumber': ?instance.phoneNumber,
  'fullName': ?instance.fullName,
  'address': ?instance.address,
  'isActive': ?instance.isActive,
  'addressNew': ?instance.addressNew,
  'bankCode': ?instance.bankCode,
  'bankAccountNumber': ?instance.bankAccountNumber,
  'bankAccountName': ?instance.bankAccountName,
};

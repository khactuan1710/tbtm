// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestDto _$RegisterRequestDtoFromJson(Map<String, dynamic> json) =>
    RegisterRequestDto(
      username: json['username'] as String,
      password: json['password'] as String,
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      address: json['address'] as String?,
      percentAppDeducted: json['percentAppDeducted'] as num?,
      eWeLinkAccount: json['eWeLinkAccount'] as String?,
      eWeLinkPassword: json['eWeLinkPassword'] as String?,
      bankCode: json['bankCode'] as String?,
      bankAccountNumber: json['bankAccountNumber'] as String?,
      bankAccountName: json['bankAccountName'] as String?,
      type: json['type'] as String?,
      addressNew: (json['addressNew'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RegisterRequestDtoToJson(RegisterRequestDto instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'fullName': instance.fullName,
      'phoneNumber': ?instance.phoneNumber,
      'address': ?instance.address,
      'percentAppDeducted': ?instance.percentAppDeducted,
      'eWeLinkAccount': ?instance.eWeLinkAccount,
      'eWeLinkPassword': ?instance.eWeLinkPassword,
      'bankCode': ?instance.bankCode,
      'bankAccountNumber': ?instance.bankAccountNumber,
      'bankAccountName': ?instance.bankAccountName,
      'type': ?instance.type,
      'addressNew': ?instance.addressNew,
    };

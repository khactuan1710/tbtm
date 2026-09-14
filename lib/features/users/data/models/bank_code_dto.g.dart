// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_code_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankCodeDto _$BankCodeDtoFromJson(Map<String, dynamic> json) => BankCodeDto(
  bin: json['bin'] as String?,
  code: json['code'] as String?,
  name: json['name'] as String?,
  shortName: json['shortName'] as String?,
  logo: json['logo'] as String?,
);

Map<String, dynamic> _$BankCodeDtoToJson(BankCodeDto instance) =>
    <String, dynamic>{
      'bin': instance.bin,
      'code': instance.code,
      'name': instance.name,
      'shortName': instance.shortName,
      'logo': instance.logo,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sepay_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SepayConfigDto _$SepayConfigDtoFromJson(Map<String, dynamic> json) =>
    SepayConfigDto(
      hostId: json['hostId'] as String?,
      webhookUrl: json['webhookUrl'] as String?,
      hasSepaySecret: json['hasSepaySecret'] as bool?,
    );

Map<String, dynamic> _$SepayConfigDtoToJson(SepayConfigDto instance) =>
    <String, dynamic>{
      'hostId': instance.hostId,
      'webhookUrl': instance.webhookUrl,
      'hasSepaySecret': instance.hasSepaySecret,
    };

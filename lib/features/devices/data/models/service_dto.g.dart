// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceDto _$ServiceDtoFromJson(Map<String, dynamic> json) => ServiceDto(
  id: json['_id'] as String?,
  serviceName: json['serviceName'] as String?,
  price: (json['price'] as num?)?.toInt(),
  totalMinutes: (json['totalMinutes'] as num?)?.toInt(),
);

Map<String, dynamic> _$ServiceDtoToJson(ServiceDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'serviceName': instance.serviceName,
      'price': instance.price,
      'totalMinutes': instance.totalMinutes,
    };

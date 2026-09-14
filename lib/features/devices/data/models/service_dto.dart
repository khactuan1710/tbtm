import 'package:json_annotation/json_annotation.dart';

part 'service_dto.g.dart';

/// A machine service option (e.g. "Giặt thường" — price + duration).
@JsonSerializable()
class ServiceDto {
  const ServiceDto({this.id, this.serviceName, this.price, this.totalMinutes});

  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'serviceName')
  final String? serviceName;
  @JsonKey(name: 'price')
  final int? price;
  @JsonKey(name: 'totalMinutes')
  final int? totalMinutes;

  factory ServiceDto.fromJson(Map<String, dynamic> json) =>
      _$ServiceDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceDtoToJson(this);
}

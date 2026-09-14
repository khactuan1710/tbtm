import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_entity.freezed.dart';

@freezed
abstract class ServiceEntity with _$ServiceEntity {
  const factory ServiceEntity({
    @Default('') String id,
    @Default('') String serviceName,
    @Default(0) int price,
    @Default(0) int totalMinutes,
  }) = _ServiceEntity;
}

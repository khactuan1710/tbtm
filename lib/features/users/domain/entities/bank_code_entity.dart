import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_code_entity.freezed.dart';

@freezed
abstract class BankCodeEntity with _$BankCodeEntity {
  const BankCodeEntity._();

  const factory BankCodeEntity({
    @Default('') String bin,
    @Default('') String code,
    @Default('') String name,
    @Default('') String shortName,
    @Default('') String logo,
  }) = _BankCodeEntity;

  String get displayName => shortName.isNotEmpty ? shortName : name;
}

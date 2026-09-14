import 'package:json_annotation/json_annotation.dart';

part 'bank_code_dto.g.dart';

/// A bank entry returned by `/bankcodes` (VietQR bank list).
@JsonSerializable()
class BankCodeDto {
  const BankCodeDto({
    this.bin,
    this.code,
    this.name,
    this.shortName,
    this.logo,
  });

  @JsonKey(name: 'bin')
  final String? bin;
  @JsonKey(name: 'code')
  final String? code;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'shortName')
  final String? shortName;
  @JsonKey(name: 'logo')
  final String? logo;

  factory BankCodeDto.fromJson(Map<String, dynamic> json) =>
      _$BankCodeDtoFromJson(json);
  Map<String, dynamic> toJson() => _$BankCodeDtoToJson(this);
}

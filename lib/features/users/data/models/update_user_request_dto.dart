import 'package:json_annotation/json_annotation.dart';

part 'update_user_request_dto.g.dart';

/// Body for `PUT /users/{userId}`.
@JsonSerializable(includeIfNull: false)
class UpdateUserRequestDto {
  const UpdateUserRequestDto({
    this.phoneNumber,
    this.fullName,
    this.address,
    this.isActive,
    this.addressNew,
    this.bankCode,
    this.bankAccountNumber,
    this.bankAccountName,
  });

  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'fullName')
  final String? fullName;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'isActive')
  final bool? isActive;
  @JsonKey(name: 'addressNew')
  final List<String>? addressNew;
  @JsonKey(name: 'bankCode')
  final String? bankCode;
  @JsonKey(name: 'bankAccountNumber')
  final String? bankAccountNumber;
  @JsonKey(name: 'bankAccountName')
  final String? bankAccountName;

  factory UpdateUserRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateUserRequestDtoToJson(this);
}

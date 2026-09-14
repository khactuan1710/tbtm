import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

/// A user/host account returned by `/users`.
@JsonSerializable()
class UserDto {
  const UserDto({
    this.id,
    this.address,
    this.fullName,
    this.isActive,
    this.phoneNumber,
    this.type,
    this.username,
    this.addressNew,
    this.bankCode,
    this.bankAccountNumber,
    this.bankAccountName,
  });

  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'fullName')
  final String? fullName;
  @JsonKey(name: 'isActive')
  final bool? isActive;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'username')
  final String? username;
  @JsonKey(name: 'addressNew')
  final List<String>? addressNew;
  @JsonKey(name: 'bankCode')
  final String? bankCode;
  @JsonKey(name: 'bankAccountNumber')
  final String? bankAccountNumber;
  @JsonKey(name: 'bankAccountName')
  final String? bankAccountName;

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'register_request_dto.g.dart';

/// Body for `POST /register` — create a user/host account.
@JsonSerializable(includeIfNull: false)
class RegisterRequestDto {
  const RegisterRequestDto({
    required this.username,
    required this.password,
    required this.fullName,
    this.phoneNumber,
    this.address,
    this.percentAppDeducted,
    this.eWeLinkAccount,
    this.eWeLinkPassword,
    this.bankCode,
    this.bankAccountNumber,
    this.bankAccountName,
    this.type,
    this.addressNew,
  });

  @JsonKey(name: 'username')
  final String username;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'fullName')
  final String fullName;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'percentAppDeducted')
  final num? percentAppDeducted;
  @JsonKey(name: 'eWeLinkAccount')
  final String? eWeLinkAccount;
  @JsonKey(name: 'eWeLinkPassword')
  final String? eWeLinkPassword;
  @JsonKey(name: 'bankCode')
  final String? bankCode;
  @JsonKey(name: 'bankAccountNumber')
  final String? bankAccountNumber;
  @JsonKey(name: 'bankAccountName')
  final String? bankAccountName;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'addressNew')
  final List<String>? addressNew;

  factory RegisterRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestDtoToJson(this);
}

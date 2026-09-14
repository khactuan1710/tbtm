import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const UserEntity._();

  const factory UserEntity({
    @Default('') String id,
    @Default('') String username,
    @Default('') String fullName,
    @Default('') String phoneNumber,
    @Default('') String address,
    @Default('') String type,
    @Default(true) bool isActive,
    @Default(<String>[]) List<String> addressNew,
    @Default('') String bankCode,
    @Default('') String bankAccountNumber,
    @Default('') String bankAccountName,
  }) = _UserEntity;

  bool get isAdmin => type.toLowerCase() == 'admin';
}

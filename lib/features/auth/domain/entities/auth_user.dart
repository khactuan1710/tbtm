import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

/// The signed-in user + session token. Serializable so it can be cached in
/// secure storage and restored on next launch.
@freezed
abstract class AuthUser with _$AuthUser {
  const AuthUser._();

  const factory AuthUser({
    @Default('') String userId,
    @Default('') String username,
    @Default('') String fullName,
    @Default('') String type,
    @Default('') String token,
  }) = _AuthUser;

  bool get isAdmin => type.toLowerCase() == 'admin';

  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);
}

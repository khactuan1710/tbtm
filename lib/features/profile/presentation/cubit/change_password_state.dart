part of 'change_password_cubit.dart';

@freezed
abstract class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState({
    @Default(false) bool isSubmitting,
    @Default(false) bool didSucceed,
  }) = _ChangePasswordState;

  const ChangePasswordState._();
}

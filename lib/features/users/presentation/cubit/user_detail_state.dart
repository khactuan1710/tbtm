part of 'user_detail_cubit.dart';

@freezed
abstract class UserDetailState with _$UserDetailState {
  const factory UserDetailState({
    required UserEntity user,
    @Default(false) bool isSaving,
    @Default(false) bool didChange,
  }) = _UserDetailState;

  const UserDetailState._();
}

part of 'user_manage_cubit.dart';

@freezed
abstract class UserManageState with _$UserManageState {
  const factory UserManageState({
    @Default(true) bool isLoading,
    @Default(false) bool hasError,
    @Default(<UserEntity>[]) List<UserEntity> allUsers,
    @Default(<UserEntity>[]) List<UserEntity> users,
    @Default('') String query,
  }) = _UserManageState;

  const UserManageState._();

  int get totalCount => allUsers.length;
  int get activeCount => allUsers.where((u) => u.isActive).length;
}
